Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40392CA5FE3
	for <webhook@archiver.kernel.org>; Sat,  3 Oct 2026 09:45:15 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2752.1791020711866740369
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Oct 2026 02:45:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SGlCJkLl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so4765565e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 02:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1791020710; x=1791625510; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=m2EkZhSgA1PpzMWRsMifPJSv0x9qZhtOlAeBYXlS4kQ=;
        b=SGlCJkLlL8nFFYiL4Il+3IjGJ64J1SWZ7OyE9k34HsXEPlS4Dw8MTbtsQ9CqeDyIJZ
         KW0YFHSMDRZ0wZUWbIIIl5UNWpdRKcVlrnTCnoBIdNHJsLQBC7nP4rbYNzEQfAalc8rJ
         yV9IKIc0BrHiiM2rrPqN9L6sNsYixJfAtl2iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791020710; x=1791625510;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m2EkZhSgA1PpzMWRsMifPJSv0x9qZhtOlAeBYXlS4kQ=;
        b=cUttrqNAyl8uOOFPaX1Mm/+3pV1sPI8J8Tw5gEhJ5hYGadLBDYOwv8cIcKXptZ92gi
         CmSgYklp1mEbD6Ao6cHuC8ISY0VKRwCNUHxIS3JErOdIg9qYJaYTpo61LphyVP0E/TE6
         ADqVMx8KO0RJXvS8wfyG1qQbl7wTuUUivLiCEiDHfHYG9O3eKyYb8/PNP+ePZFcyFRij
         6/Gi+ptPS8pWIwjIdGsYOyQk8uric5MEjOmjyLRW6gCqoDXfqL2sOmE9k+RQ9g3x5F1a
         z5DhaWstfY+NKNXPLo2/5y50Y7tM7hPF4zbmwE4aNca3pulpnwVYM5zNJ9I9cpDrF9rv
         jniA==
X-Gm-Message-State: AFuF++nVjaOlhH2EevMUEEbnCD6ezkkcRIP9RIiRpJwBzAjH9txIrLJ3
	SW2NcQSfmPvJkclv0dDI/HODmVQ01tV7qLjx+q+nBW/VvG4VEFoMYnr1yn2Aa3Jqd1g=
X-Gm-Gg: AYBFou3ahhwxABHQMNDJXnU6MuASh4LCVLoeoukWgzVHp3QCoSIj85aJbhRCfOUwwTl
	OMFg4dJp/BV4hsYM+hVLJ5YfI2cAE8WsMLxX2Rkmx4F8OaoVqLVWPfCAeaj01Nq/rveOOJJ+2fh
	UOCgRkaMEzgcM9xKrV/lxwmi2xR5+/WGeBLyT0oMP+7HtKIMx4TTaMZToYmqYYhsRrR421oYnce
	0EXJ7Q/ij8BDDO6uPEWgzxGY0tIkwOClZ0v6wLDUsAhW9X0AALKoRkfaQe6lpHlShprdsMswJk0
	DWYZ3BGMXQCNUKzXA4okTdSfvsg4U0kToxZSr0vYzRAtL1wl4hUDAQ514IXIy7py13Q0hxV+/dN
	+wf3R1VRPFSqcJhN8xn50NnjE4H5PIbOsMSSH4kJSJzsrRX+Na2XnT4wXjw1270hAbfv5g/PUD1
	5RbmFr2CuuhgW+xazfD0s+EbDrx6vmLGjvPLWyKrM3i8C6eXxuDAa4janYR/8Yq1ln0g6oGKiUT
	ic7Qf/ganX1JxScw72z6SiR81sGfDO3EsDMPC/zvBZXmlMmIlmcfLIZ5mZV
X-Received: by 2002:a05:600c:4708:b0:4a0:dca:b78 with SMTP id 5b1f17b1804b1-4a1680f4165mr29609945e9.27.1791020709983;
        Sat, 03 Oct 2026 02:45:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b2f:8e30:9800:972c? ([2001:8b0:aba:5f3c:b2f:8e30:9800:972c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff20831sm95780525e9.4.2026.10.03.02.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 02:45:09 -0700 (PDT)
Message-ID: <b94f423e6023039363bb84a1ae14583a5d389be9.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 01/13] scripts: resulttool: add 'durations'
 option
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com, "tgamblin@baylibre.com" <tgamblin@baylibre.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Sat, 03 Oct 2026 10:45:08 +0100
In-Reply-To: <BB4DFAF2-1A9A-488F-97A7-43F96272C09B@arm.com>
References: <20260923190419.353493-1-tgamblin@baylibre.com>
	 <20260923190419.353493-2-tgamblin@baylibre.com>
	 <BB4DFAF2-1A9A-488F-97A7-43F96272C09B@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 09:45:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247151

On Thu, 2026-10-01 at 16:34 +0000, Ross Burton via lists.openembedded.org w=
rote:
> On 23 Sep 2026, at 20:04, Trevor Gamblin via lists.openembedded.org <tgam=
blin=3Dbaylibre.com@lists.openembedded.org> wrote:
> > +# Matches the section titles "resulttool report" prints before each
> > +# Recipe/Passed/Failed/Skipped/Time(s) table (see template/test_report=
_full_text.txt)
> > +REPORT_SECTION_RE =3D re.compile(
> > +=C2=A0=C2=A0=C2=A0 r'^\S+ (?:PTest Result Summary \(Libc: [^)]+\)|Ltp =
Test Result Summary|Ltp Posix Result Summary)$')
> > +REPORT_ROW_RE =3D re.compile(
> > +=C2=A0=C2=A0=C2=A0 r'^(?P<name>\S.*?)\s*\|\s*\d+\s*\|\s*\d+\s*\|\s*\d+=
\s*\|\s*(?P<duration>\d+(?:\.\d+)?)\s*T?\s*$')
>=20
> Is there a use case for when you have resulttool, a textual summary,
> but not the JSON test data?=C2=A0 I=E2=80=99m wondering if this functiona=
lity is
> useful enough to justify having a fragile regex-based parser on a
> file that we don=E2=80=99t commit to maintaining the format of.

I'd add that the test cases for this are fragile. They hardcode the
current report output whilst we really want to ensure that the current
report output would work properly.

I do think having some duration support in resulttool would be nice but
I suspect we don't need the report parsing piece. Most cases where you
have the report you would have or can get the json results.

Cheers,

Richard

