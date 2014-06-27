Return-Path: <tom.rini@gmail.com>
Received: from mail-qa0-f51.google.com (mail-qa0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id 85E5F60809
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jun 2014 12:42:07 +0000 (UTC)
Received: by mail-qa0-f51.google.com with SMTP id j7so3946387qaq.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jun 2014 05:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=RuRV82kvswYgONVp2Dg+PG93pA6a687fHotN00e186c=;
	b=LYhLQovSReorxtAxoApUQelloBgcfH9M9VJLtCv03lD9ygVyldBzBbrfJcavKKlqxc
	4GLdskw0SBs/2jHpPFm7swp3MKlgprH228CPKtcn1sTpkPr1TSjrwsUoaAPWUzHAqsMh
	G7cKHavwMg0cy0bJ2fqpRURsAd9WjGZTSvXjWgUUm1uAG1PWqdhGB5GCPUS3054MvkoP
	c/RxcwUaaYm9+Xx/n9lYHLXg1Iyhb2I0KxieXZ49B03tEwrmMz2m3HsAkK7+YHd00JA+
	JZSFjem4haKX4F4E11ESIMZzQCGoWQU3T66Q8yjpv6fRWNgMSsuzy+j7TBuS61+7dcVU
	8l3Q==
X-Received: by 10.140.27.108 with SMTP id 99mr7070098qgw.77.1403872928087;
	Fri, 27 Jun 2014 05:42:08 -0700 (PDT)
Received: from bill-the-cat (cpe-098-121-186-226.ec.res.rr.com.
	[98.121.186.226])
	by mx.google.com with ESMTPSA id m92sm6143729qgd.29.2014.06.27.05.42.07
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 27 Jun 2014 05:42:07 -0700 (PDT)
Date: Fri, 27 Jun 2014 08:42:09 -0400
From: Tom Rini <tom.rini@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20140627124209.GS9006@bill-the-cat>
References: <1403785652-17065-1-git-send-email-tom.rini@gmail.com>
	<CAP9ODKopjX4Jg5rTDLunZnV4xioqP7dCP09o-GB0t4yJxE-L3Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKopjX4Jg5rTDLunZnV4xioqP7dCP09o-GB0t4yJxE-L3Q@mail.gmail.com>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image.bbclass: Ensure IMAGE_FSTYPES is fully evaluated before live/live logic
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
X-List-Received-Date: Fri, 27 Jun 2014 12:42:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 26, 2014 at 02:25:34PM -0300, Otavio Salvador wrote:
> On Thu, Jun 26, 2014 at 9:27 AM, Tom Rini <tom.rini@gmail.com> wrote:
> > Incase we have overrides applied to IMAGE_FSTYPES we need to make sure
> > that we evaluate it fully before performing the live and vmdk logic
> > checks.
> >
> > Signed-off-by: Tom Rini <tom.rini@gmail.com>
> 
> Do you have an example how it used to fail?

Sure:
diff --git a/meta/recipes-core/images/build-appliance-image_8.0.bb b/meta/recipes-core/images/build-appliance-image_8.0.bb
index 7b70025..23bb02e 100644
--- a/meta/recipes-core/images/build-appliance-image_8.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_8.0.bb
@@ -17,7 +17,7 @@ IMAGE_ROOTFS_EXTRA_SPACE = "41943040"
 APPEND += "quiet"
 
 DEPENDS = "zip-native"
-IMAGE_FSTYPES = "vmdk"
+IMAGE_FSTYPES_x86-64 = "vmdk"
 
 inherit core-image
 
And now you won't get vmdk images on qemux86-64 (same for live, did the
same proof-of-concept there when working up the patch).

-- 
Tom

