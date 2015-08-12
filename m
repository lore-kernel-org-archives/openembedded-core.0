Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 30E3576793
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 14:44:28 +0000 (UTC)
Received: by iodb91 with SMTP id b91so21856279iod.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 07:44:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=LjQqeufb6alBkFtYn++gGvWZjFf2aji6s5aZuDL5vUM=;
	b=A94TpSYgMbHfWH3JzqNA+f+JrYISg9d7jvWyfkkY6yfA134B8XHQm03/t1YbOcqlAh
	1LyySSgYv5hZccZVWCDpkvDfiLO8YhtOMgZr9RLdfAghbdio1IB7hUUU68PfCroTO8xu
	KGbQLSTf4HgYYW+mvXQUZgapVozvWK8IaEEddJgtpq03NB+imxLpG71B14CLajqh/8DS
	Lx+iRsBPLvvWO6m0/CMI1mWegP/NZw7Pl6rEzIjTzJ7JlykOis78iy5poa7F7FXqhQwM
	OIXEaVRYbfkN0P/tJkgbe3AFw4mQgsstVspjH0ZehSS8OnZwuF5poJ0Kaudn/bKYHDrj
	kGBQ==
X-Gm-Message-State: ALoCoQmJk5zfIdMlAJiHS6Z/Cv1KNC6kCu1GQB1LmRa04VKLI2KcPOVb0AfbMKaVD1TMJzSeN2xb
X-Received: by 10.107.46.156 with SMTP id u28mr34368204iou.186.1439390668626; 
	Wed, 12 Aug 2015 07:44:28 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8D086.dip0.t-ipconnect.de. [93.232.208.134])
	by smtp.gmail.com with ESMTPSA id
	hh9sm3943083igb.18.2015.08.12.07.44.27
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Aug 2015 07:44:27 -0700 (PDT)
Message-ID: <1439390665.28153.41.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Wed, 12 Aug 2015 16:44:25 +0200
In-Reply-To: <55CB5960.9010708@windriver.com>
References: <cover.1439281753.git.patrick.ohly@intel.com>
	<55CB5960.9010708@windriver.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] preserve xattrs in images
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
X-List-Received-Date: Wed, 12 Aug 2015 14:44:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-08-12 at 09:34 -0500, Mark Hatle wrote:
> Is there something here that enables the tar-replacement-native?  Or is the user
> just expected to know they need it?

The user is supposed to ensure that it gets depended on if (and only if)
needed.

I gave the following usage instructions in the comments of the
image_types.bbclass patch:

+# By default, tar from the host is used, which can be quite old. If
+# you need special parameters (like --xattrs) which are only supported
+# by GNU tar upstream >= 1.27, then override that default:
+# IMAGE_CMD_TAR = "tar-native --xattrs --xattrs-include=*"
+# IMAGE_DEPENDS_tar_append = " tar-replacement-native"

> If you look at meta/classes/sanity.bbclass, there is already a tar check for a
> specific old version that can't handle overwriting symlinks properly.  It should
> be possible to check for the distro feature of xattr and that the host tar has
> this.  It would be good to prevent the user from having a problem early (sanity)
> rather then at filesystem generation time.

The way the patch series is intended to be used at the moment, the user
will not have a problem regardless of the host tar, because image
creation will always use a recent enough tar. It might build
tar-replacement-native unnecessarily, though.

A distro might also impose additional restrictions on the host's tar and
then will not need to be build tar-replacement-native; I haven't tried
that, because I'd still like to be compatible with Debian 7 which would
fail the requirement.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




