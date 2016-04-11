Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 71DDD6FFD4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 16:52:30 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id o126so194420235iod.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 09:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=M4k85zyudArvBzTitK+C0UGY6EZbrpzERVcPNAt/hKM=;
	b=CPwfIHy+zVQMJmIpz1nL+QD461V/YnhPjhcUwILrUmtLUGILMDqJtvxKLWWi4NzrZZ
	6u0xkB7tyQIbT5hI3Sh0MsrV+LETAeyz9xB/9wd6/Yb50CHqvmwusXbZ3CIUc//SwFOt
	4d/vsRi5yUgHgzzGJuJf2MQnaXeTZ4Gp/bdcoYnQudJyoLBo5qrOUKLOPgYtXxZIpa1f
	pCLLdm8r2JWLQtzHvQxDTUhuEQdoRt5kef5UhwgD4i5gAVMXQhnAem8U2x3ehJA9UnPn
	H8nCxMuj9d6+X9kh6ylZjTGPO6SfcVmXOE765KNWsgETABz7wnPsZ5uVwQRY90yXfLRP
	U51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=M4k85zyudArvBzTitK+C0UGY6EZbrpzERVcPNAt/hKM=;
	b=kSQbYicxYnUE5MOZT1S2S/Xd4n2PE0Mwm7STbNAYz85iiplFPUJy3yWxVzmtR/DZXy
	n+C2bVWIRR4qPH4RwsAcxAW6Y8bi+m1VKWmLNFhB3sKpFTtkVsk2DqDm+Nv5av67zpMb
	IjRYmIvwfmXPtmXZuYr4g91aVjt0D2LeynaLDMQrfbItozCHyyZg71tVtX3821XTmpIu
	tOAEq6M/CEK2biTvZwtHTrakraQWVKZNZN/KinQdMCEV1d1ZYW0h61fEsw2wBuNpcmvX
	9IcEhCchBtLPo7W6ZfjGb/Gzs3TzixzEPiKsgZmyzToFZazoe62fLRBQ4hN6jG9dDBiX
	pPMA==
X-Gm-Message-State: AD7BkJLJvaBscUFHy0J8iQPB/AXxX7NENYiBbfs7pBceNbWtcbhqop51R5LLdMaWVq1HfAniTA+NP1eiTThmFP8N
X-Received: by 10.107.16.104 with SMTP id y101mr22578934ioi.148.1460393551438; 
	Mon, 11 Apr 2016 09:52:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.132.24 with HTTP; Mon, 11 Apr 2016 09:52:12 -0700 (PDT)
In-Reply-To: <1460091428-15870-1-git-send-email-denis@denix.org>
References: <1460091428-15870-1-git-send-email-denis@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Apr 2016 17:52:12 +0100
Message-ID: <CAJTo0LYeWqjTM63t6rDjTMqqZiqEF16jnGURODh6ZCvxrbhHTA@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] opkg-utils: re-do find/ls code to not fail on filenames with spaces
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
X-List-Received-Date: Mon, 11 Apr 2016 16:52:31 -0000
Content-Type: multipart/alternative; boundary=001a113ff020dddeac0530385e4b

--001a113ff020dddeac0530385e4b
Content-Type: text/plain; charset=UTF-8

On 8 April 2016 at 05:57, Denys Dmytriyenko <denis@denix.org> wrote:

> +From 8e424296ce2af4a5a7392c38a31f8723f9b9fbda Mon Sep 17 00:00:00 2001
> +From: Denys Dmytriyenko <denys@ti.com>
> +Date: Thu, 7 Apr 2016 20:43:13 -0400
> +Subject: [PATCH] opkg-build: re-do find/ls code to not fail on filenames
> with
> + spaces
> +
> +Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>

Speaking of which, this is missing an Upstream-Status.

Ross

--001a113ff020dddeac0530385e4b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 April 2016 at 05:57, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=
=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":trz" class=3D"a3s" s=
tyle=3D"overflow:hidden">+From 8e424296ce2af4a5a7392c38a31f8723f9b9fbda Mon=
 Sep 17 00:00:00 2001<br>
+From: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com">denys@ti.com</=
a>&gt;<br>
+Date: Thu, 7 Apr 2016 20:43:13 -0400<br>
+Subject: [PATCH] opkg-build: re-do find/ls code to not fail on filenames w=
ith<br>
+ spaces<br>
+<br>
+Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com">denys=
@ti.com</a>&gt;</div></blockquote></div><br>Speaking of which, this is miss=
ing an Upstream-Status.</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Ross</div></div>

--001a113ff020dddeac0530385e4b--
