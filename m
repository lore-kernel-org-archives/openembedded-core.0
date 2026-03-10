Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C106FD4F0C
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 17:26:31 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.932.1773163588535066621
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 10:26:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wl3pnltH;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8cd7aab92dfso15355885a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 10:26:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773163587; cv=none;
        d=google.com; s=arc-20240605;
        b=PMoS7XZ5EzixWkPVgyIqRN7wap8KN4KHUY7bjTDe3VNgsJ1BEa/PFfY7vz1uMz7MLd
         5VJXKyl3eUPRUcSRGtmWNuDRFyresp3KK1JFySVu9dkzTJI7HTiLyZhuRHNRu4ZhdJAT
         Q8+RtX559a5x7RNuC2hy9pDoKncB/5edVvq/h8Ls69hIlZDmH50J1uccf0oDKp/9khYo
         d0aCuL/qKYZgRqsOzDC6s6+BGtCR92ivfAM1e0XQ2LO1zwkW67Q4xdgSD6cg/vp+fZVD
         dzrV5vYpVZHZiTtTnvJXNHfrYXPB+HcwZvdC3eGS2H2xXJu/JDxoik99+fTId5DFyoP7
         5mjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=57CRUnZRSGj4MBmqbkefuKZ9dDtd4YC9DnrNhzJVaLo=;
        fh=aLcXMuQqBBhhCa3FaClzatRGJ0TNJKp30HcY4U5n6tM=;
        b=W0fVxLswzYEIb2TxvatGJTIMWsFNSA/yQM+4uLfv2LdcD4kEx+bJ0x+Z1kdGIqRL+P
         QngZMoziwCVb2XqM4PNYajLQY1z0MGOaFDsLTZH9oZT8XLz7UiIHsjwSzOp9epqc+Azg
         Cv4dlJ+743SfQhY7EHaBWjWruQJxMSKjbBUItvp2Mlxzvcldnu0L835RfFIfn9rMT73n
         mRYY7ceo2OCoi8mY+qX+rFps2sKuTNuMvJFIibUYmcdjSSk6+zZZyk69/KAw5BxJuZW+
         NMo+R7GSsN3wbTLACNNV1BE+iM+dfi2Tx7oO919dzvN1isKc7U8tGAI2i+57CPAcfpPp
         i7dA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773163587; x=1773768387; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=57CRUnZRSGj4MBmqbkefuKZ9dDtd4YC9DnrNhzJVaLo=;
        b=Wl3pnltHbJgy0c4ynx9r1EqIZg5nk2vLREaNZNe9alQFp29PwOdnxvrzA1XvPoCQWI
         vn1tku0CwSNhceYop0ehw0BjjFouBQFXQqR5uxI31/tSzdJfuV8V4PwQyrtEB6vJvzh6
         3dFAKpGaNw6NUikyGahqQFjYKoK2G+e+scV8iXi23yORX38zTX4XTaf+fZOJQ6iVDm8u
         S+GUcdsjWReOOuWF0LRmyoDlTLfyXQZYd/gT/m1aC/Zx+ChaU6wW+FIfqsL0QdzV6ajM
         yiTOAuniphzswNRKpQbHxigiIB9Lkq0dnwO24nS8XwYxAEjF7wr8iBo9FEtlSdst5Xli
         XlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773163587; x=1773768387;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=57CRUnZRSGj4MBmqbkefuKZ9dDtd4YC9DnrNhzJVaLo=;
        b=jA2X9w66W/QgyA+M9PyZcuk1uu4HYx24CoYYbYAPEo5JHDQhMiPX+IabjAuzAu2Ds2
         tfgAP5FKZYD+GNsG9QGIXMp1V6DLjqixtwvVdGpcNLwSnrgHh3VXbH95MyFvxJdXZu7Z
         8Z7Tzt8VppP2DVGAzaCi9vVVXIvr62flQOgNi4tfYVWXbcQEYLO97HL8OxN8g1MQRl6N
         rXa9xPmUrrBnNtEDvRSBQLJnjtI1jxKh/tBWWWAlMNws2bf17ydIzmGVchg5WVbVE3US
         CSd1mR0JyyZMvfH1Ktg/s/5BrpFWWCIvjwUs3vK4aYaE2S6DWgvJaf1uo0b5NoEkcPse
         M9OA==
X-Gm-Message-State: AOJu0YwOZFkADlOF2cwlp7XabIYkKUsBP/3+yOq1huw2O3ifdYr8G7V7
	kA/EuM2+oty1ui2oRwK0mtE3W41330Hf3XUzQwKTl0Xs0/EjpQ8WZlTF5bYYb1KYHLyYwZD4+CH
	1M9ohvVuqvxDz6kEspuCbQt/6n6GTHnc=
X-Gm-Gg: ATEYQzzza328gUVw0zB0RqE8lbjs4xFg8//Iuly/5lDBwBFfBYr2NtBxEebJwhC9DcC
	xqSZEBWiLo8uEGsKQPg4xcOkXdxQoHYLbL56a+gpupHtCK7dTfVFznFBTZH+c+4Lp3IvTwV0H/7
	cYybgNjQa0Et6yz48ATXOfwzbra0dNsvssJgJbYQ8Ykg9MrcLJZ0VCSpyvZO2NOB18Th9dnOR2T
	7o4JbtlzSyljJlxXmunUeIkBQAKhg5M0MOxAEGbOGlFZp4N9F5oW+lS2F4KaXtLvzaIKpetUMAz
	5J9g7piroTh1WhQGolxfCS2A0FRRq81LLiYHAVxoKA==
X-Received: by 2002:a05:620a:40c2:b0:8ca:a98e:bd0 with SMTP id
 af79cd13be357-8cd93becd8emr487863985a.27.1773163587513; Tue, 10 Mar 2026
 10:26:27 -0700 (PDT)
MIME-Version: 1.0
References: <SN7PR11MB770572B1859AB0B7EB592DE3CD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <CANNYZj9Y0Fk_DHxTcP-2cqmYnzcD4_VSg5eihwXp1Vc10HbREg@mail.gmail.com>
 <SN7PR11MB770587ED31BE8EE18D973740CD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <SN7PR11MB77056419029EAA594968E1DECD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
In-Reply-To: <SN7PR11MB77056419029EAA594968E1DECD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 10 Mar 2026 18:26:16 +0100
X-Gm-Features: AaiRm51zExTccn_QszV3X20ABueAkddOKiNVotLGXAEW45_MZfj7lsKV4Blx6XY
Message-ID: <CANNYZj8uCJWnkhvh=CecWiawWd57k15wdqcfzc3mtbxoMFqSHg@mail.gmail.com>
Subject: Re: [OE-core] RPM 6 in Wrynose
To: "Matthew Ware (mattware)" <mattware@cisco.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Elliot Sparling (esparlin)" <esparlin@cisco.com>, Robert Yang <liezhi.yang@windriver.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, adam.duskett@amarulasolutions.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 17:26:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232800

On Tue, 10 Mar 2026 at 18:24, Matthew Ware (mattware)
<mattware@cisco.com> wrote:
> Also, since we're here: is there any plan to move to DNF 5? I see Wrynose is staying on 4.x, but wondered if there was a plan/aim for DNF 5.

Yes, there are WIP patches for it too. Adam is working on it.

I have to ask: can you give us some context? What makes you interested
in having these versions in Yocto?

Alex

