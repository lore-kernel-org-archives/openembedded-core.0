Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C7D6E95A61
	for <webhook@archiver.kernel.org>; Sat,  7 Oct 2023 12:39:38 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web11.16699.1696682371835710876
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Oct 2023 05:39:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm2 header.b=f4bCeX4P;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=ojSdXYug;
 spf=pass (domain: zhukoff.net, ip: 64.147.123.25, mailfrom: pavel@zhukoff.net)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id EAF3732009DB;
	Sat,  7 Oct 2023 08:39:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sat, 07 Oct 2023 08:39:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1696682368; x=
	1696768768; bh=FTPW74fhI/bLBTVvRF6wNWpAPFGyphkidf4zubnPjEY=; b=f
	4bCeX4PEF+y3lgEB/QosJkvYsH56F/2vDoF+N7L65wONPuseRlMMaSpQHNJ/WcZU
	D7+W9S6EcxYIQTCyg/ZuSd9Ab5LnaENCuzDcCUmfkXc44iYNjuIJG1n5XXbLFf8R
	4ZrKET6rSBN5OwkNq8JyvY95B0/ToUtuDaR2snhODkE+NNK7U4qdebaoFwYOgy92
	c4Ps48FxNepjWCYShb5JItoyhK18fgIZSCt6OVKCH1NG5Q7IU4PfRJnqCUmoVAoG
	xioAlASbOJ+cu5zKZa5PPZjISyYRPk0Jp37eNOQCbBeCcWuLRgZXnQGp+b6gQoHi
	Y8oIAGpcVh0mnx/HFd+pA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1696682368; x=1696768768; bh=F
	TPW74fhI/bLBTVvRF6wNWpAPFGyphkidf4zubnPjEY=; b=ojSdXYugOa3BlALDq
	Mb71zPHZ9++ZWtJG2M2yLdWMXWGVwCcp3GwGij6jSEy7uCQay+qTZa/7CJWU8z0O
	5lLagzGhg9n53c4A22gQbxe/Nh0JNBDfpGDxq8zNqNv6mifTIekztR7DY3Ji9+vp
	0+KjDm00kj9zNG8AqUW1rpGSFZE/n1ve+/rqMzueDEnmNhfa4PBP4JnFR4f6iouz
	gw919jSMXirxTWmlX9IOQ8ORxt7V3vvFlWpHCT2LHiIT33ljdkPK0g+DdjudXKaP
	LCHR6fWIeJUKnt9zHUdQM87TzKMMpLsxqbtZq/PaHSBrP2JCoMF0LsA87XJkMVKJ
	0CTdw==
X-ME-Sender: <xms:gFEhZUjtwasVHBO6po472nbp46QJ1f93tf--p-jH9qCOVMg-yeOxJA>
    <xme:gFEhZdDTFtPmzwFNqvXrOfnTNTlTIKxxKR0ex_lbrXJ8BJTrRAzQv52wSJY80I8Fm
    ajJGbb1xux_6CHeZSc>
X-ME-Received: <xmr:gFEhZcFnJf42AKxRgAiZZyI8nWztiac_KpgL6thyqzHdacE7LrUkOgKygDvGC4x7RBIjyh-DKl53CvXJBBw2cvVP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrgeelgdehgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpehffgfhvfevufffrhgjkfggtgesthdtredttdertdenucfhrhhomheprfgrvhgv
    lhcukghhuhhkohhvuceophgrvhgvlhesiihhuhhkohhffhdrnhgvtheqnecuggftrfgrth
    htvghrnhepjeeutdekfeejvdeuudfgjeeijeefiedtgfeggefhteekleehgeeiudfhudel
    vdejnecuffhomhgrihhnpeguvggsihgrnhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:gFEhZVT_8xma5cKDncR9khBJKk0jxYObvesa2FRLZ6iUjV5ssUZSUA>
    <xmx:gFEhZRzz_Lmii9JuItKzKXzDygNxoq3OX57DoHbpOHEfAY6CSAl5_A>
    <xmx:gFEhZT5H1VnBtkNCHXM_XyLiP5orbRXAXyZHYGSS-dmpq8B0B82BLQ>
    <xmx:gFEhZfZbdQTZ6GWVpW9LmY32YWuXcddD4V67FYRajkCT1vnj2iuPkA>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Oct 2023 08:39:27 -0400 (EDT)
References: <20231006191013.3770695-2-pavel@zhukoff.net>
 <20231006191013.3770695-3-pavel@zhukoff.net>
 <AS8PR02MB10201AEB8262CA73F9AC023D1EFC9A@AS8PR02MB10201.eurprd02.prod.outlook.com>
User-agent: mu4e 1.10.6; emacs 29.1
From: Pavel Zhukov <pavel@zhukoff.net>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 2/4] package_deb: Revert versioned
 providers workaround
Date: Sat, 07 Oct 2023 14:36:23 +0200
Reply-To: pavel@zhukoff.net
In-reply-to: <AS8PR02MB10201AEB8262CA73F9AC023D1EFC9A@AS8PR02MB10201.eurprd02.prod.outlook.com>
Message-ID: <87zg0ur4lj.fsf@desktop.zhukoff.net>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 12:39:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188796


Peter Kjellerstedt <peter.kjellerstedt@axis.com> writes:

>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Pavel Zhukov
>> Sent: den 6 oktober 2023 21:10
>> To: openembedded-core@lists.openembedded.org
>> Cc: Pavel Zhukov <pavel@zhukoff.net>
>> Subject: [OE-core] [PATCH v2 2/4] package_deb: Revert versioned providers workaround
>> 
>> dpkg and apt seem to handle versioned provides correctly now [1] so this
>> workaround is not needed anymore.
>> This fixes [Yocto #14995] for package_deb.
>> 
>> [1]
>
> Was there supposed to be a reference here?
>
Yes, there supposed to be link to the documentation...
https://www.debian.org/doc/debian-policy/ch-relationships.html#virtual-packages-provides

>> Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
>> ---
>>  meta/classes-global/package_deb.bbclass | 9 +--------
>>  1 file changed, 1 insertion(+), 8 deletions(-)
>> 
>
> //Peter


