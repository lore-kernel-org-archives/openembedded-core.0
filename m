Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9657AD1A45A
	for <webhook@archiver.kernel.org>; Sat, 12 Oct 2024 09:41:18 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.7686.1728726074239970109
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Oct 2024 02:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jv7FfkQJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c949d60d84so1671493a12.1
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Oct 2024 02:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728726072; x=1729330872; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RnZPcrslLbDUXTgPoc0KozZZ5NRtCL0LsALrJX/mLho=;
        b=jv7FfkQJAvtidvlC3AkW4dMfqTKApfqmwtKT/LVR93aW+EgxV1/AS+m1TrUhpWTR0Y
         WCPNhel8OTWiQjYLiX18HVbIMHFKFjuhx9jdFpbVhtH6BGpImZfDp0ChrkvoS6BKe3m+
         5lJNFmlRqgafxJoY6vWOHz5yxqflKlEoqEDzXc/h2tDum0DHubP0cKWXZcOUXDl+SADp
         G9Xq3/XI+vBAyuknIehbNqkexKXi98+ZHLL3UUJzUEzhUrQsv4tKypB/+0pt/3c+cLK9
         tN5dNCZndSd1PYYRF76iBbfD4yQuReklBuRM2EJZSg5lIWoHYIXgHjjbh4o1qEnpcJdm
         wgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728726072; x=1729330872;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RnZPcrslLbDUXTgPoc0KozZZ5NRtCL0LsALrJX/mLho=;
        b=kY3Lz6J2bvxYxuDwQPs1qrPnA7rEs2oquTDiNMTIGXCyuDEmr2K6zc3Wj1bJG4WAy2
         eKZtf1xBO8gJYwG5MGbJ5Ys9EHYjpfePj2GCXfhjdmBhsPwMxSyD/KR7QwKBP8TqSVsZ
         nf60JQRxISlneju3oMyVgfa76geWz2xBr1LWt/LkQsVNdId7js3S7ugCo2CRaxNQcbLn
         BkNIedizFcBjBKFQ9cPPuW5dKZLZZ4jm357ENwo6w/oK6zqajQBjaorYXqzKj8x0YVLI
         AJESIfcTyKe/i4CyyvIXNJQv89TgPqzfcCmmh9OzHNOqxFrd884wvq/a8UB+Tpww8EXs
         akUg==
X-Forwarded-Encrypted: i=1; AJvYcCXcU3s42G+R6Pj0z5YiKXtyq4BR7KYLbMugpmAZK2pUK0QWSrtEDA3AMDaBlhly27koEth8Z9LUXZchpZnqVZco1w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy39/pzW9QE4v2KQmYWp7DHP8RFUSd5JDuEONspvL04u7AbzkKb
	Aw52Hx7GWmrokMXKjXygiLGmyJBUq0NTkBlqFKICuAh49nvDPasj
X-Google-Smtp-Source: AGHT+IEJL1AxrpyLpdPg+q77ZitYKJWM9Ldz4laZ3/8FiqEzEplTO5lLyIwJ/3J/xOQC1Q5SH3S0OA==
X-Received: by 2002:a05:6402:348e:b0:5c8:8381:c308 with SMTP id 4fb4d7f45d1cf-5c948c8831fmr3631832a12.5.1728726072208;
        Sat, 12 Oct 2024 02:41:12 -0700 (PDT)
Received: from [192.168.1.55] (0x57346aa5.static.cust.fastspeed.dk. [87.52.106.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c9372632a4sm2732149a12.78.2024.10.12.02.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Oct 2024 02:41:11 -0700 (PDT)
Message-ID: <84989466800399ebfc139396b659573edb7570c5.camel@gmail.com>
Subject: Re: [OE-core] [RFC][master][PATCH] populate_sdk_base: Add
 SDKIMAGE_INSTALL_COMPLEMENTARY_HARD_DEPENDS_ONLY
From: claus.stovgaard@gmail.com
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, Ross.Burton@arm.com
Date: Sat, 12 Oct 2024 11:41:10 +0200
In-Reply-To: <CANNYZj_-phKSj0smbkC=n5UVgDzmB5zxoOsOSnVhA=unGaJzRg@mail.gmail.com>
References: <20240927132040.200122-1-claus.stovgaard@gmail.com>
	 <c3155a29aa855283f3396582c989263d93ded4f3.camel@linuxfoundation.org>
	 <2456863182484d2b15f75fe0f67a3473240a3fe6.camel@gmail.com>
	 <CANNYZj-Wna0xVjvoX0hJwd9Kg_=yaVB+dNLecBDsjpSayo1zVg@mail.gmail.com>
	 <2b4615fffa3c131e9795255c4884d6b9eea98c86.camel@gmail.com>
	 <CANNYZj-LcppbLy4bsHH6oRJeK6pPVXgVB_oq1UPik9B5wO2oGg@mail.gmail.com>
	 <41e5d235b97218e65737069ea5f541ae2114dbc9.camel@gmail.com>
	 <CANNYZj_-phKSj0smbkC=n5UVgDzmB5zxoOsOSnVhA=unGaJzRg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Oct 2024 09:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205705

On Fri, 2024-10-11 at 10:51 +0200, Alexander Kanavin wrote:
> On Thu, 10 Oct 2024 at 23:01, Claus Stovgaard <
> claus.stovgaard@gmail.com> wrote:
> 
> > Hope it make it more clear what workflow their is broken with the
> > change, and why my patch suggest to making it a configurable
> > option.
> 
> Thanks, this is much clearer now. I do wonder if we really need all
> the complication of having an extra variable (that isn't tested). Can
> the dummy app recipe be written such that it takes the list of
> DEPENDS, and adds everything in it to RDEPENDS, with -dev suffix?
> 

Thanks, I was looking into using the RDEPENDS of the dev package, and
after some work I came up with below section.

<snip>
python package_depchains:append() {
    pn = d.getVar('PN')
    recommends = d.getVar('RRECOMMENDS:' + pn + '-dev' )

    # Append the recommends to the RDEPENDS, so it end in requires for
the package
    d.appendVar('RDEPENDS:' + pn + '-dev', recommends)
}
</snip>

This also works pretty well, but I am hitting some problems with
packages like sqlite3 and googletest (gtest).

sqlite3 is becaues the resulting package is not named sqlite3-dev but
libsqlite3-dev
googletest_git.bb provides gmock/gtest so the package would not be
named gtest-dev but googletest-dev

I am working more with it, and I think there might be a solution in
sight. Though if you have any ideas please share.

Regards
Claus




