Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6D9626017E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2015 22:51:48 +0000 (UTC)
Received: by iecrl12 with SMTP id rl12so6766643iec.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Mar 2015 14:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=4/CRz7dVnvhLeHxfAg2A0R2it/yNCGa1ACgCHwV70XE=;
	b=C0QgPnYWpiHYGy3Qpy+OAs8eWVu1fY7NNRxbR9C7LMxRlUwqLEB3gv9tYyko3HDQQG
	yVAqQjYRrUn3dTePv1Q39pbSJQYBatDxk9D16KsE2ZKlDF2bdz5uncG4e8Lq8uAiFXio
	e+vLoG63NflG9c+EweMvdgvdbzzA437aeeNysAPMbM+cni+8Z19NasHEiDkvdj5EtCNF
	HnKIamoGCkce973EbVvr/bDNMUl+DToHCFT6Ip0HeRpvExSTIArCfkVY3WAlT//4Bcis
	u6POgL08ynt9v0ySG7G7vDR/0CW8BlBJzkmAS4feC3v1ks6JJHcLbw7OKuawCaZvfwjY
	mAPg==
X-Received: by 10.50.80.12 with SMTP id n12mr57244602igx.29.1425682309376;
	Fri, 06 Mar 2015 14:51:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Fri, 6 Mar 2015 14:51:19 -0800 (PST)
In-Reply-To: <1425650611.2831.20.camel@bottazzini-ThinkPad-T430>
References: <bruno.bottazzini@intel.com>
	<1425504462-6979-1-git-send-email-bruno.bottazzini@intel.com>
	<1425504462-6979-4-git-send-email-bruno.bottazzini@intel.com>
	<20150305142802.GA6833@ad.chargestorm.se>
	<1425572096.2831.16.camel@bottazzini-ThinkPad-T430>
	<20150306082330.GA14309@ad.chargestorm.se>
	<1425650611.2831.20.camel@bottazzini-ThinkPad-T430>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Mar 2015 14:51:19 -0800
Message-ID: <CAMKF1sp4pDdt_rS223_YqmeyB0yAVFkafR7tnuq3uztm9vV56Q@mail.gmail.com>
To: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
Cc: Anders Darander <anders@chargestorm.se>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] systemd: split modules into packages
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
X-List-Received-Date: Fri, 06 Mar 2015 22:51:49 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 6, 2015 at 6:03 AM, Bottazzini, Bruno
<bruno.bottazzini@intel.com> wrote:
> On Sex, 2015-03-06 at 09:23 +0100, Anders Darander wrote:
>> * Bottazzini, Bruno <bruno.bottazzini@intel.com> [150305 17:15]:
>>
>> > On Qui, 2015-03-05 at 15:28 +0100, Anders Darander wrote:
>>
>> > > Just a quick question before I look into the patch in more detail.
>>
>> > > Is the new setting of PACKAGECONFIG consistent with how systemd was
>> > > built previously? I guess it is.
>>
>> > Hi Anders,
>>
>> > it is consistent with how systemd was built previously. If you apply the
>> > patch and bitbake it. Systemd will be built and shipped normally.
>>
>> > But now it will give some options on how to customize it by excluding
>> > packages you don't want to be with systemd.
>>
>> Nice, I'm really liking this! That's something I've planned on doing
>> myself for a while.
>>
>> > > Another comment, you should remove the dependcies that gets added using
>> > > PACKAGECONFIG from DEPENDS, e.g. acl etc. (Or are they required
>> > > nevertheless?)
>>
>> > You mean I should do the following ?
>> > - PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl"
>> > + PACKAGECONFIG[acl] = "--enable-acl,--disable-acl"
>>
>> No, I  meant to remove them from the long
>> DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux"
>> line. (Unless I overlooked that part in your patch?)
>>
>> > If I get what you said correctly, yes they are required.
>>
>> What I meant, was thas unless e.g. acl is required even when building
>> with --disable-acl, it's better to add the acl dependency in the
>> PACKAGECONFIG like you to. Though, at the same time, remove acl from the
>> long DEPENDS-line. (As otherwise we'll build acl anyway).
>
> Anders,
>
> You are right.
>
> It is not needed to specify the libs on depends.
>
> I have removed it and as soon as we review the whole patch I will send a
> new version with this corrected
>

On top of all this 'acl' is a distro feature so that should be
accounted for too.

