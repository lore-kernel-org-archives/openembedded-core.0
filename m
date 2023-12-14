Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91893C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 23:04:23 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.44215.1702595054908421257
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 15:04:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=R7fgbPJl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BFE7660006;
	Thu, 14 Dec 2023 23:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702595053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1wagevbYuLxnYwK7K1sz/Dc0iLak3OPgloSfFcyBClY=;
	b=R7fgbPJl47JswNGRdjCIgjTz09Pg0XKV0ptKg4ijQPECgmNKugh3FGmJWiEwTLYEbCsI+B
	Ww3SPo+SUEAyh81fq2UsWYdjKD5WsckQRscrOpMGijyCiCxfltFDAzWggpenJzsvJrixbF
	bSFJMbJlQ94IjF0XvI4hEF51WKdwqDXuDpZhYet9l+EhWg/VEAYNmaCtG2+e3LvtPZx9SJ
	i5MDEzd02iJaTXafGYJsAW2hzL+OMCZ6kZWhmMP3csqATp5lwDt0VZdIzge8+aiP58Zkfp
	f2S66MHYiiQ/tS0nnwKWvWmskCfzHTl/kwHde6s6J0dA3YWspe6G3dQiYoPbXg==
Date: Fri, 15 Dec 2023 00:04:12 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Viswanath Kraleti <quic_vkraleti@quicinc.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 1/2] systemd-boot: Add recipe to compile
 native
Message-ID: <2023121423041292dec8cb@mail.local>
References: <20231213115748.487216-1-quic_vkraleti@quicinc.com>
 <20231214080209d1f89221@mail.local>
 <944c0685-ef03-4e58-bed6-30f888cef0b9@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <944c0685-ef03-4e58-bed6-30f888cef0b9@quicinc.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 23:04:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192409

On 14/12/2023 20:11:16+0530, Viswanath Kraleti wrote:
> 
> 
> On 12/14/2023 1:32 PM, Alexandre Belloni via lists.openembedded.org wrote:
> > Hello, this causes:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/8617/steps/11/logs/warnings
> > 
> > WARNING: Nothing RPROVIDES 'python3-pefile-native' (but /home/pokybuild/yocto-worker/build-appliance/build/meta/recipes-core/systemd/systemd-boot-native_254.4.bb RDEPENDS on or otherwise requires it)
> > WARNING: Nothing RPROVIDES 'systemd-boot-native-dev' (but /home/pokybuild/yocto-worker/build-appliance/build/meta/recipes-core/systemd/systemd-boot-native_254.4.bb RDEPENDS on or otherwise requires it)
> > WARNING: Nothing RPROVIDES 'systemd-boot-native' (but /home/pokybuild/yocto-worker/build-appliance/build/meta/recipes-core/systemd/systemd-boot-native_254.4.bb RDEPENDS on or otherwise requires it)
> > 
> 
> Thanks for pointing.Uploaded a new patch-set to address these.
> https://lists.openembedded.org/g/openembedded-core/message/192384
> 
> Some how in local build no warnings seen. Is there a way to run auto builder
> locally before submitting patches to avoid this?

Well, this one is simply a checkout of poky with the following
configuration:

https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/8617/steps/10/logs/stdio

The failing command was then:
bitbake universe -k -c fetch -k


> 
> > and:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6133/steps/14/logs/stdio
> > 
> > The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
> > systemd-boot-native (/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/recipes-core/systemd/systemd-boot-native_254.4.bb)
> > 
> For updating maintainer, can I submit a change post patch acceptance?

No, your patches need to pass the tests before they can be merged.


> 
> > On 13/12/2023 17:27:47+0530, Viswanath Kraleti wrote:
> > > systemd-boot native recipe provides ukify tool to build
> > > UKI images for systemd-boot
> > > 
> > > Signed-off-by: Viswanath Kraleti <quic_vkraleti@quicinc.com>
> > > ---
> > >   .../systemd/systemd-boot-native_254.4.bb          | 15 +++++++++++++++
> > >   1 file changed, 15 insertions(+)
> > >   create mode 100644 meta/recipes-core/systemd/systemd-boot-native_254.4.bb
> > > 
> > > diff --git a/meta/recipes-core/systemd/systemd-boot-native_254.4.bb b/meta/recipes-core/systemd/systemd-boot-native_254.4.bb
> > > new file mode 100644
> > > index 0000000000..0cdd7e7045
> > > --- /dev/null
> > > +++ b/meta/recipes-core/systemd/systemd-boot-native_254.4.bb
> > > @@ -0,0 +1,15 @@
> > > +require systemd.inc
> > > +
> > > +inherit native
> > > +
> > > +RRECOMMENDS:${PN} += "python3-pefile-native"
> > > +
> > > +COMPATIBLE_HOST = "(aarch64.*|arm.*|x86_64.*|i.86.*)-linux"
> > > +
> > > +do_configure[noexec] = "1"
> > > +do_compile[noexec] = "1"
> > > +
> > > +do_install () {
> > > +       install -d ${D}${bindir}
> > > +       install -m 0755 ${S}/src/ukify/ukify.py ${D}${bindir}/ukify
> > > +}
> > > -- 
> > > 2.25.1
> > > 
> > 
> > > 
> > > 
> > > 
> > 
> > 
> > 
> > 
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#192337): https://lists.openembedded.org/g/openembedded-core/message/192337
> > Mute This Topic: https://lists.openembedded.org/mt/103147679/5192326
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [quic_vkraleti@quicinc.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> > 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

