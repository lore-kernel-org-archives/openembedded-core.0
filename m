Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74FF6C98304
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 19:47:34 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3862.1790192846981924497
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 12:47:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=W2HFzqAy;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.76, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-484366874b0so858763f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 12:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790192845; x=1790797645; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=g2OEwVjZsg6vE4YXkhd9jZxaax1NJ6iptcaPlWYNrmg=;
        b=W2HFzqAyxI0UKBfMgNVKDgyYqXikbarks4k5bR6IJ+2QiYk8McF75b2EiTIQsNpQfG
         TQZ5AVxtRoFUTvN7TLLhfOHZv9MkTWHhB89F46SkUrrXvp6+yuRm08alR4tJkGeT6K2p
         JuiFcZseNeUY9E928/yZtE9sGtW0fJB2wHhAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790192845; x=1790797645;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g2OEwVjZsg6vE4YXkhd9jZxaax1NJ6iptcaPlWYNrmg=;
        b=dDXd3JlmccmbX5m28molMF8E0OIHoKO4Hbd4p8mKAIVriJdUUHyiRTgfrMZGAKPWpB
         KqSjZeIox+pOKAhngkP1+hsIF+SVz3ZedDhvcVZPXraLubETZTPjaDPl5YLN/YmsPhbc
         ggzuugj1RWefxq1tL0yXrudo43RIRnINL3XKgiePJob0ZPoQYIIx7b0nS6lS+6i7yjBe
         NgQ99xdY/gsRhUJOIPTnnhVUT5sUhuugwsR3F4ctkd+tlxxVnlMr2wa7dgg53v35u3TQ
         zFXSx2gHs+l5H84rQYICUhYbhTi7kSua/iwtq4e2LHzKR6GakTqzvhn1QatoDWyxOW2Z
         nWtw==
X-Gm-Message-State: AFuF++mqImd4Wad0O/l0aB8eq0BrFdm5JeYbrwWUKCZe4f/cw6m6kZRG
	OFTO4IoEx4duFc8Wi/CBnfH3Yg92QLbI3ktQCd/r1uOADgIh5vDNf0YQT+EROBC1r2Q=
X-Gm-Gg: AYBFou3HA2jBFthTZo744ltYVkk0637BWca3lS74ASvdhfFbXnrUxOXWEhID4tlACG6
	OBk5zhqx5W3SQgUZEPfVSvAd+aaDoB/hgwAyM/TnOHqzTAFBfU7n7R8QZ8dcvg+8YbVAFIE3XFA
	ObyU5Lpw9MKN/bP34eB/3e7G0sXuQlpciJXhOZElvs/w4vxSypHrn318tWuYcLvDZkJivH+FHic
	x3MLEH/Tv6i9zNTtLgq0mSbJQrR7tVNBIFjg4DXY5HwoVdk8SHNtpCso5uFAfl/21x780UDZqdg
	rIs6dKDZH+k3BdCYAn9gQlr6dC2nIyA5F1X3bGqtvW9JHiMcMwPQUAct0Lyge11Figdyh+bwF0U
	/9lG8naR0vr4YYsh9mq19qtUvlb+Tdi/bATMqWMS8Se7aM+6H8gnxLhuuEGpjtwTwt0Gw51zpKy
	1kwAxMAoh1cGFYn/gmXfU4YO+S8cKMN8xl3ULDUwIlFrzSz8liy5ILjP0/q1I5uQgQnda8IGK6b
	mUe5BBERwJSJTiCeFMORrhJBRvA83cotRJC2+YDw0nR2AVOt6to2yPt4S//uMI=
X-Received: by 2002:a05:600c:4505:b0:49b:9105:cdaf with SMTP id 5b1f17b1804b1-49fe66d069dmr3941525e9.8.1790192844938;
        Wed, 23 Sep 2026 12:47:24 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:36fd:f492:2703:247a? ([2001:8b0:aba:5f3c:36fd:f492:2703:247a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5ba0444sm9811205e9.2.2026.09.23.12.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:47:24 -0700 (PDT)
Message-ID: <98ded4246a7043b511aec098142bdf0b30e08300.camel@linuxfoundation.org>
Subject: Re: [OE-core] Topic: native libstdc++ and uninative
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, peter.marko@siemens.com
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>, "Freihofer, Adrian"
	 <adrian.freihofer@siemens.com>
Date: Wed, 23 Sep 2026 20:47:23 +0100
In-Reply-To: <CAMKF1spD1wpQm5STRFFjCRSrhXHix54BC_e=EXgw-5LCQUzzVw@mail.gmail.com>
References: 
	<AS8PR10MB5073C8A330EA6849DA8DE457FD822@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
	 <CAMKF1spD1wpQm5STRFFjCRSrhXHix54BC_e=EXgw-5LCQUzzVw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 19:47:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246539

On Wed, 2026-09-23 at 12:11 -0700, Khem Raj via lists.openembedded.org wrot=
e:
> uninative only makes glibc (and libgcc_s) universal. libstdc++ is
> still taken from the host, both when linking and at runtime. Native C++
> artefacts are therefore only portable to hosts whose libstdc++ is at leas=
t
> as new as the one on the machine that built the sstate.

Hmm.=20

$ ls tmp/sysroots-uninative/x86_64-linux/usr/lib/

shows libstdc++ so it should be available at runtime?

Cheers,

Richard

