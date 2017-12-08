Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 546DF6FFD7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Dec 2017 10:48:48 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id t8so2607891wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Dec 2017 02:48:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=U0sORzIm19YffTgNaRSgVHIYGg9KL769M9ir72u/Vw4=;
	b=tMWh4fgs3JAdQGOZhO9EC5SjH9cphWzR4uqwXlDrS2R4udUBp20At/Cb1QdmsdUwJB
	OXmSWNtNMdQQlqEOw+94d/8yh5u2EDmZr2Q71vdWgYUbqbxS5Pax0mHHUFMHBSR++x2j
	ubwE+Em3IRvJfRk9LMAFVYW2RFN51ZOhdFJ7eG3A9qLWlh1alsxcU9EaHybmNtxDjdlO
	Gi17zesbNGzCjiz7cy93J5K45N7y4PvqoZ6wNgkomfeDZnvbEW23G/Kr/54FSJxWtZbf
	jlBWwF4LD5cY04HBXu6NbLkgf2NN4PkvJk+Vpf/QdDInuJeJVCsQydJ60skm8CvbjkO4
	7mUw==
X-Gm-Message-State: AJaThX4gYhlsG47CI2RT/S/foG73+A5norpQR49hgp8y/sGe0fMtS+DS
	KO4MkstUxdbAujbN3CzFD1iyGWy7
X-Google-Smtp-Source: AGs4zMZn6Ark7LVLrkMSGONpYBpenjWifOI2hplxYUQYfcCVItv++uLPlYZWPxUMRvk/e2AHOUkTew==
X-Received: by 10.80.145.154 with SMTP id g26mr49805035eda.140.1512730128665; 
	Fri, 08 Dec 2017 02:48:48 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	g25sm3318765edc.68.2017.12.08.02.48.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Dec 2017 02:48:47 -0800 (PST)
Message-ID: <1512730125.32455.28.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 08 Dec 2017 10:48:45 +0000
In-Reply-To: <20171207211610.19158-1-gael.portay@savoirfairelinux.com>
References: <20171207211610.19158-1-gael.portay@savoirfairelinux.com>
X-Mailer: Evolution 3.26.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] package_manager.py: fix opkg custom config path
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Dec 2017 10:48:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-12-07 at 16:16 -0500, Gaël PORTAY wrote:
> The opkg custom config feature has moved to the package_manager python
> module. This feature is broken since commit 19c538f57c.
> 
> The python function os.path.join joins path components. If a component
> is an absolute path, all previous components are thrown away.
> 
> The sysconfdir variable is an absolute path component. It causes the
> leading target rootfs component to be removed. As a result, the
> package-manager module tries to write in the real root filesystem
> instead of the temporary work directory for the rootfs image.
> 
> This fixes the issue by prepending the target rootfs component using the
> string concatenation operator when the file is opened (without using
> os.path module).
> 
> Cc: Ash Charles <ash.charles@savoirfairelinux.com>
> Signed-off-by: Gaël PORTAY <gael.portay@savoirfairelinux.com>
> ---
>  meta/lib/oe/package_manager.py | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/lib/oe/package_manager.py
> b/meta/lib/oe/package_manager.py
> index 6cbb61fd84..ac29593f88 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -953,12 +953,11 @@ class OpkgPM(OpkgDpkgPM):
>              """
>              if (self.d.getVar('FEED_DEPLOYDIR_BASE_URI') or "") != "":
>                  for arch in self.pkg_archs.split():
> -                    cfg_file_name = os.path.join(self.target_rootfs,
> -                                                 self.d.getVar("sysconfdi
> r"),
> +                    cfg_file_name =
> os.path.join(self.d.getVar("sysconfdir", True),

The 'True' argument has been removed from all getVar() calls, please don't
re-introduce it.


>                                                   "opkg",
>                                                   "local-%s-feed.conf" %
> arch)
>  
> -                    with open(cfg_file_name, "w+") as cfg_file:
> +                    with open(self.target_rootfs + cfg_file_name, "w+")
> as cfg_file:
>                          cfg_file.write("src/gz local-%s %s/%s" %
>                                         (arch,
>                                          self.d.getVar('FEED_DEPLOYDIR_BAS
> E_URI'),
> -- 
> 2.15.0
> 

Also, a simpler solution would be to simply strip the leading '/' from
sysconfdir:

                     cfg_file_name = os.path.join(self.target_rootfs,
-                                                 self.d.getVar("sysconfdir"),
+                                                 self.d.getVar("sysconfdir").lstrip("/"),
                                                  "opkg",
                                                  "local-%s-feed.conf" % arch)

would be the only change needed.


Cheers,
Andre'


