Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5D52E7016E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 08:52:46 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5G8qjK9024477
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 16 Jun 2017 09:52:46 +0100
Message-ID: <1497603165.24449.6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ed Bartosh <ed.bartosh@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 09:52:45 +0100
In-Reply-To: <1497602452-2535-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1497545468.29576.22.camel@linux.intel.com>
	<1497602452-2535-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 16 Jun 2017 09:52:46 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH v3] image_types.bbclass: get rid of IMAGE_DEPENDS
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
X-List-Received-Date: Fri, 16 Jun 2017 08:52:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-06-16 at 11:40 +0300, Ed Bartosh wrote:
> The IMAGE_DEPENDS variable can be overriden to add dependencies for
> individual image types.  Those dependencies are added to the
> do_rootfs
> task, while they really should be added to the specific image type
> tasks.
> 
> Also, the IMAGE_DEPENDS variable is not documented anywhere.
> 
> Replaced usage of IMAGE_DEPENDS with explicitly added
> dependencies to do_image_<image type> tasks.
> 
> [YOCTO #11302]
> 
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  meta/classes/image_types.bbclass | 41 +++++++++++++++++++-----------
> ----------
>  1 file changed, 19 insertions(+), 22 deletions(-)
> 
> diff --git a/meta/classes/image_types.bbclass
> b/meta/classes/image_types.bbclass
> index 7749b00..0d7c27e 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -29,12 +29,6 @@ def imagetypes_getdepends(d):
>      deps = set()
>      for typestring in fstypes:
>          basetype, resttypes = split_types(typestring)
> -        adddep(d.getVar('IMAGE_DEPENDS_%s' % basetype) , deps)
> -
> -        for typedepends in (d.getVar("IMAGE_TYPEDEP_%s" % basetype)
> or "").split():
> -            base, rest = split_types(typedepends)
> -            adddep(d.getVar('IMAGE_DEPENDS_%s' % base) , deps)

You need to do the compatibility checking here I'm afraid
since d.getVar('IMAGE_DEPENDS') is not the same thing
as d.getVar('IMAGE_DEPENDS_%s' % base.

Cheers,

Richard

