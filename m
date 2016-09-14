Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id C4670771C6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 09:56:45 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id 186so15781558itf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 02:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FX07+CNDoR6tOaoSVCpzMH7TEousmXxQ8rHyWcgQNrY=;
	b=wibl60wXUTORybC617VHJALOcWlbK6A7xA04WLt7OL2WbmMkE2VuEuHjgFhAhScewa
	QQDPXDdHma4pmAIUrQ0z7EvGVMDabE9gLhXj8uCtFwkOzEV1OSy7KDuvUtiJovUEv/DG
	kg7w9fSdGK0SFAybi2lD2+qA96ZrTgo/n7jjeHezdfhNamm7MCoKbp5X9kyNhLOzZVHw
	KdUy6f5lb8qUQ3NW9xY1KgunXASkbYFKfVrceCwBY1yBrgMhmoley7nKikhLT9BGFeeZ
	HMQ+/glMGblwYB5/E3Ys6hcxrDnJtUNl4KQvj4N3VMakOXcq29Xa0N4ZIFWer1hgB7ll
	y+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FX07+CNDoR6tOaoSVCpzMH7TEousmXxQ8rHyWcgQNrY=;
	b=GNlDDQCd+CNS6XnUR1G6jAmMQKeMoOO7xXQaJwst2S+N0rJy37GdCpe6tbR6lUkezC
	hqjPrjIvWFAu+tgksgVIsxmYvOJ4wQY7BmcpoC8EA8jZ1qcTBuRnha1TiJv462HEeegT
	fELWHjniAT+BLddYa0NS1BwuiJpeP5rrjROhhq2DFLQoKpa8Rc/2BiNXqqp6dM5/Wx9z
	xVIDR4IPT7lcYPno7gl5Az7fLoEDHrp3o9izSAXc+Onb3dVAnZ2CKbrsp82SksOXM7Y0
	AMZutKKzFHKVVS/sD6bkwwxkkeobNt8rkVslGOMuHpLeNPXqu7wAlnfK9JYoqhdf+EbX
	0JtA==
X-Gm-Message-State: AE9vXwOCmFj3RGGz1aq7qTZcBtJFXiIYHNtR7NEYzg9uBQ6uaKpahl7rH//A4irhnxsjOUzLpokCNWGLEaLFY1Nx
X-Received: by 10.107.129.18 with SMTP id c18mr4401643iod.40.1473847006118;
	Wed, 14 Sep 2016 02:56:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.27 with HTTP; Wed, 14 Sep 2016 02:56:25 -0700 (PDT)
In-Reply-To: <1473803568-13012-2-git-send-email-juro.bystricky@intel.com>
References: <1473803568-13012-1-git-send-email-juro.bystricky@intel.com>
	<1473803568-13012-2-git-send-email-juro.bystricky@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 14 Sep 2016 10:56:25 +0100
Message-ID: <CAJTo0LaR5V+yFUr33G+h1=Ja=PpGTC0OtbSQOn9M06tz38vbCg@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] busybox: Avoid race building libbb
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
X-List-Received-Date: Wed, 14 Sep 2016 09:56:48 -0000
Content-Type: multipart/alternative; boundary=001a113f970a40e4f4053c74bf18

--001a113f970a40e4f4053c74bf18
Content-Type: text/plain; charset=UTF-8

On 13 September 2016 at 22:52, Juro Bystricky <juro.bystricky@intel.com>
wrote:

> +++ b/meta/recipes-core/busybox/busybox/busybox-kbuild-race-
> fix-commit-d8e61bb.patch
> @@ -0,0 +1,45 @@
> +From d8e61bbf13d0cf38d477255cfd5dc71c5d51d575 Mon Sep 17 00:00:00 2001
> +From: Denys Vlasenko <vda.linux@googlemail.com>
> +Date: Sun, 21 Aug 2016 22:00:20 +0200
> +Subject: build system: different fix for
> + include/applet_tables.h/include/NUM_APPLETS.h
> +
> +Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
>

The two backport patches need your Signed-off-by and Upstream-Status:
Backport tags.

Ross

--001a113f970a40e4f4053c74bf18
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 September 2016 at 22:52, Juro Bystricky <span dir=3D"ltr">&lt;<a href=
=3D"mailto:juro.bystricky@intel.com" target=3D"_blank">juro.bystricky@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1l=
l" class=3D"a3s aXjCH m157258a56acec85a">+++ b/meta/recipes-core/busybox/<w=
br>busybox/busybox-kbuild-race-<wbr>fix-commit-d8e61bb.patch<br>
@@ -0,0 +1,45 @@<br>
+From d8e61bbf13d0cf38d477255cfd5dc7<wbr>1c5d51d575 Mon Sep 17 00:00:00 200=
1<br>
+From: Denys Vlasenko &lt;<a href=3D"mailto:vda.linux@googlemail.com">vda.l=
inux@googlemail.com</a>&gt;<br>
+Date: Sun, 21 Aug 2016 22:00:20 +0200<br>
+Subject: build system: different fix for<br>
+ include/applet_tables.h/<wbr>include/NUM_APPLETS.h<br>
+<br>
+Signed-off-by: Denys Vlasenko &lt;<a href=3D"mailto:vda.linux@googlemail.c=
om">vda.linux@googlemail.com</a>&gt;</div></blockquote></div><br>The two ba=
ckport patches need your Signed-off-by and Upstream-Status: Backport tags.<=
/div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</=
div></div>

--001a113f970a40e4f4053c74bf18--
