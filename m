Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF4ECA5FA5
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 16:56:45 +0000 (UTC)
Received: from mail-qv2-f21.google.com (mail-qv2-f21.google.com [74.125.230.149])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1094.1790701000820016379
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 09:56:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=S9PvcXKh;
 spf=pass (domain: gmail.com, ip: 74.125.230.149, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv2-f21.google.com with SMTP id 6a1803df08f44-91782a91a3aso13278516d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 09:56:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790701000; cv=none;
        d=google.com; s=arc-20260327;
        b=YzFOUltwebhweb4WUUf0CtwtJbCzlDUqTSPBElRQW8vYsSrOQBb/ANR7xNZw7TS7IB
         z8LplFb4ZenWmqvPEWaPVrkYwuJMlj7YMXGpxc9XyusRqD8S4fwaUjhwVsH6h58SOZDZ
         yvIPFY6pEVe+NcqV0NkbFBCdd+zsxEWxi22UYAFsarNw2JEAJi3zxWQ7v5m6QLoVVDwg
         reuTLltb5nZ88k4Iy/WB9E0MZcRLQA+DWOQ56AhO49M0KMmkjZBb0AnWc/J73Wx2zZIb
         Wd1xnaa09/Srnpea1yB3naATiWfO8TeUH1DTVgBGgJz0qxJRWPh7nHPmpL82a6+3zzmH
         F+Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aD/JfAmE64vfKvYbvhT/iQ3DB7kTwO93rQoEr4fq/t8=;
        fh=qZIMn/HmCLlXNaIbZUF4zlW7Z7QtvOlTyKnEis1hno4=;
        b=IpP7YSd+Fy0MYwnQ0MM6zMXaxq0BI6fdxviN0n+yTe0C0pjNMA9CT1Zz7zID1vuhtN
         XDrad2s0eLtzbwTjt1LWXzxCzdGSbg5aSDTg7rPR98edgnwFX/xNkR5KMpskPdcxAhKS
         /bDcu4Rr5VIfBvOeA3eS/nhY0g612d8AufLTxuVl8RNGbAqTDVcfcOY4YviYNK1aF/5x
         snV8SJU15W9RQvcl4IMJZuLvvf3AiMni6sxsTTAM4SiyG8CJWqFOJqXBWL1UwlMDIYqc
         fWo/7Kiu8E4Av/nLyUykqtCB2GVH7HLTXMtQrlwuRuVddMklusxRxWyF+6HBJ9OHEMaK
         OhNw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790701000; x=1791305800; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aD/JfAmE64vfKvYbvhT/iQ3DB7kTwO93rQoEr4fq/t8=;
        b=S9PvcXKhs8cLKWf4+Hs78F+Rko9V3K6C1QHOJY2QwpDx02ChTF0p+ATX4Q5hLF2xLA
         TPKpqurAF4enf70fihr0NohAsek2kOtyDx9wSw3gfrRIn5zg7y2+1J1520+nZVtowarm
         hxg0w6U67gPjsPQ7GDv/1zezilPRa5OFvAR3o7E20jW6kP3fQRYuZbpuceKFdRgaytTH
         YoV4btpgvzdcw3jiKEk9V6fQDo17M281IQ3XoytCJOMWyJSDE0VNbBw0XeKwA1TF8uFj
         dOYau15K1fBHXxohPeeXy2elqtv4zVoMtIVc744XJmFP4pRjgfNIC90oCa1EMzAtlEpm
         L3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790701000; x=1791305800;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aD/JfAmE64vfKvYbvhT/iQ3DB7kTwO93rQoEr4fq/t8=;
        b=aeY5G85Dv3bw5klhlAuPnu33SzXL3A9vnxzSpiKtW9Dhgj8R5n3rIW1M8vgpt6d6rK
         JYmtEXVYMpFuhC4vN9Q5w65ZwRgTW1I1QH71n/H97xEiMjZWgpcU+ZrGS9G5VQeL0tRW
         BhiG3aCSP2bG/jQG7kKnzh2pxpQ28Z3wCxqXcFdI7QoWRa13sMpWv4kRwCVtJp9Bn3gU
         02ibeV+szE6id90teHqbeeh6JgiKlJXMPRuPB4dHPBruUtVDNdeUp7Y3AnVO3Uyr5DZb
         N2gAukd97JrDVUByfP9+FeH5KBC5b94Xfvgsir9pnPE0JyMJEVCgZP8T4n8YvriDhu4H
         vtaw==
X-Gm-Message-State: AFuF++kVJLsyej+nvvHP3YpM99Obek/qbR9+tl2Gqj92acokAgzpPFGF
	4Ch0fkWD+4tA86iAL12nwmXDD8q50UPQcNbULhmoHtQS/JR4Rg2uZZxYMwUoYEAJjS+ihX6pLpL
	d7xHQ3g4zqp73Snqr5C0AYpv3DmH3yjg=
X-Gm-Gg: AYBFou2ektBf8sQm9/MTi/wYCXMA6yUH7DOnA9Nb9VjJR9IMvZPDn1TJJV+zqVczoAs
	pjo/XC79fV3U0OKI1g/dzubQxxy2o14MKhbUSdZ87Fk+4RZXZogMrUG47b5OlaYhY46pRGwipOI
	0Cw1CalFjeys3hZZAxmiQscO6ccYtAlnckzQzstXhGUCMbRoY5vsDbGCRjkA+etEIi92NWaO13F
	g3JBAz9uFRgnnXGHf0TKU4LLVin/TZfbktffPqFjSl4LZXL7J7dVgwdkbeaKX3s/mo8MmHT2u/c
	xndOxd1BsqBQ+82jFGucXp6WUrgF7GQQ+BF2gmV0COmLS78NNFXfAai5MYmN/gT9Si45w7h9NeG
	Wz4EbaEGHYfX5yg==
X-Received: by 2002:a05:620a:6017:b0:937:d6e8:59b0 with SMTP id
 af79cd13be357-93c9f95cc18mr25122085a.10.1790700997894; Tue, 29 Sep 2026
 09:56:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260926191132.45145-1-f_l_k@t-online.de>
In-Reply-To: <20260926191132.45145-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 29 Sep 2026 18:56:26 +0200
X-Gm-Features: AclHuK8r0pz-J8dZY9ik0D-lVdGHUVGrtbbLzYdsxVACxLCiZovX8on-DY05q_c
Message-ID: <CANNYZj_8Nnn+FkikffvnjPNaiosweWe3298eyzyR6Z-PcNv7XQ@mail.gmail.com>
Subject: Re: [oe-core][PATCHv2] cpan: do not rebuild the Makefile when perls
 config is re-staged
To: f_l_k@t-online.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e0e5e1065ca210c2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 16:56:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246885

--000000000000e0e5e1065ca210c2
Content-Type: text/plain; charset="UTF-8"

On Sat, 26 Sept 2026 at 21:11, Markus Volk via lists.openembedded.org
<f_l_k=t-online.de@lists.openembedded.org> wrote:

> The Makefile depends on Config.pm and config.h of the staged
> perl. After pulling an oe-core update that installs perl fresh into the
> sysroot, these become newer than the Makefile because of a sed in:
> staging.bbclass:185
>  cmd = "sed -e 's:^[^/]*/:%s/:g' %s | xargs sed -i -e
> 's:FIXMESTAGINGDIRTARGET:%s:g; ..."
> Thus make regenerates the Makefile, its asking to be rerun and fails.
> Clear CONFIGDEP so
> make ignores those timestamps; a real change of perl reruns do_configure
> through the task
> hash anyway.
>

Thanks, this is a much clearer description of what is happening. But isn't
re-generating the makefile actually the correct behavior in this case? Why
is it failing? Shouldn't we fix the fail instead of suppressing the
regeneration?

Alex

--000000000000e0e5e1065ca210c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, 26 Sept 2026 at 21:11, Markus Vol=
k via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> =
&lt;f_l_k=3D<a href=3D"mailto:t-online.de@lists.openembedded.org">t-online.=
de@lists.openembedded.org</a>&gt; wrote:</div><div class=3D"gmail_quote gma=
il_quote_container"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The M=
akefile depends on Config.pm and config.h of the staged<br>
perl. After pulling an oe-core update that installs perl fresh into the<br>
sysroot, these become newer than the Makefile because of a sed in:<br>
staging.bbclass:185<br>
=C2=A0cmd =3D &quot;sed -e &#39;s:^[^/]*/:%s/:g&#39; %s | xargs sed -i -e &=
#39;s:FIXMESTAGINGDIRTARGET:%s:g; ...&quot;<br>
Thus make regenerates the Makefile, its asking to be rerun and fails. Clear=
 CONFIGDEP so<br>
make ignores those timestamps; a real change of perl reruns do_configure th=
rough the task<br>
hash anyway.<br></blockquote></div><div class=3D"gmail_quote gmail_quote_co=
ntainer"><br></div><div class=3D"gmail_quote gmail_quote_container">Thanks,=
 this is a much clearer description of what is happening. But isn&#39;t re-=
generating the makefile actually the correct behavior in this case? Why is =
it failing? Shouldn&#39;t we fix the fail instead of suppressing the regene=
ration?</div><div class=3D"gmail_quote gmail_quote_container"><br></div><di=
v class=3D"gmail_quote gmail_quote_container">Alex</div></div>

--000000000000e0e5e1065ca210c2--

