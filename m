Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 645D3C38145
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 10:46:19 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.4997.1662115569031380920
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 03:46:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MW5nhOGO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id b16so1779567wru.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 03:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=kKZxDU5ADDFlqokhIs+BFifkcQlmfwsI+5XyuKddPUQ=;
        b=MW5nhOGOsnQBlMXkjOOjIJ7Z6PdfdG/MJJLi2mSqU3mt7pNGXhsDpWF0e8ni80V/CX
         ieAJTuEpXOs87l9d/YL7cxhsnklcCjSv1/+FkBCEDGPR+efnl6jPAUGEREFd1KAtPXA3
         r8hdxnKnw1Sa94JCRso4N2cs2EToyn3f96gzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=kKZxDU5ADDFlqokhIs+BFifkcQlmfwsI+5XyuKddPUQ=;
        b=MjAUERt7PIs+Itfcko3dvomQId6wib+mbQU5dtHZGl3DN0GnLG9vu0VUgxvMkfHE2M
         4Pa4QhnUOr76wqWQKxXdqtFp1WlE9KkVjEKqqmaGSXHWxtPnxksMRYrx+grivA7h1ePj
         tnkWuR66nz7bfuJJmxxrUBfLoHCQ4Ft0qIukwlnxqCGgztx2FahMekVNJnoV2sz2WWK1
         v5cFwkL8HIuIUqsS067A7OlH2f2d62Pq8LOVT6ZfXZ5JUES4WsHtS/JrnYKtlL0eQAhM
         wvy90YMjSM1wQwCp7vxX/EuE1kdZ/sLDrt+VU0tMuh0LqEd7wy2hCWim5Wz3YZUgxvNY
         NY+w==
X-Gm-Message-State: ACgBeo3QeU9yPN4QG7ogTzSbY/XtCchF5GvgBqKWkovOHqRPyrThNqn8
	qMkS9Jo6KlYKGnarBVWpdHrlDA==
X-Google-Smtp-Source: 
 AA6agR7Vo5ybhQDV8xbYqyeZriFMO84reDCQcGO+jKjorIB4pvCTRv8+yzXwpwk0zXWLuG/tgYlXbg==
X-Received: by 2002:a5d:6b8d:0:b0:226:d47e:6ffb with SMTP id
 n13-20020a5d6b8d000000b00226d47e6ffbmr15826781wrx.254.1662115567404;
        Fri, 02 Sep 2022 03:46:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e969:460c:a8b4:e544?
 ([2001:8b0:aba:5f3c:e969:460c:a8b4:e544])
        by smtp.gmail.com with ESMTPSA id
 f3-20020a1cc903000000b003a604a29a34sm1763606wmb.35.2022.09.02.03.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 03:46:06 -0700 (PDT)
Message-ID: 
 <40a7dbd874811a04c1e948c7f2192688ead5050c.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] classes: cve-check: Get shared database lock
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: Joshua Watt <JPEWhacker@gmail.com>, Steve Sakoman <steve@sakoman.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 02 Sep 2022 11:46:04 +0100
In-Reply-To: 
 <CAApg2=StgBK-TavxR_dFbSCibep5co_cD_s2KXZse-+8=FPk0A@mail.gmail.com>
References: <20220830155939.662178-1-JPEWhacker@gmail.com>
	 <1710F97D4670CB8B.3145@lists.openembedded.org>
	 <CAApg2=StgBK-TavxR_dFbSCibep5co_cD_s2KXZse-+8=FPk0A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Sep 2022 10:46:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170241

On Fri, 2022-09-02 at 10:50 +0200, Marta Rybczynska wrote:
> On Fri, Sep 2, 2022 at 9:09 AM Marta Rybczynska via
> lists.openembedded.org <rybczynska=3Dgmail.com@lists.openembedded.org>
> wrote:
> >=20
> > On Tue, Aug 30, 2022 at 5:59 PM Joshua Watt <JPEWhacker@gmail.com> wrot=
e:
> > >=20
> > > The CVE check database needs to have a shared lock acquired on it bef=
ore
> > > it is accessed. This to prevent cve-update-db-native from deleting th=
e
> > > database file out from underneath it.
> > >=20
> > > [YOCTO #14899]
> > >=20
> > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > +                cve_data =3D get_cve_info(d, patched + unpatched + i=
gnored)
> > > +                cve_write_data(d, patched, unpatched, ignored, cve_d=
ata, status)
> > > +        else:
> > > +            bb.note("No CVE database found, skipping CVE check")
> > >=20
> >=20
> > With this commit in kirkstone-nut, we're getting an error with
> > meta-zephyr builds:
> >=20
> > RROR: zephyr-philosophers-3.1.0+gitAUTOINC+2ddd73feaf_5f86244bad-r0
> > do_cve_check: Error executing a python function in exec_func_python()
> > autogenerated:
> > The stack trace of python calls that resulted in this exception/failure=
 was:
> > File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
> > 0001:
> > *** 0002:do_cve_check(d)
> > 0003:
> > File: '/tmp/workspace.4jc1Y12y3W/oe-core/meta/classes/cve-check.bbclass=
',
> > lineno: 142, function: do_cve_check
> > 0138: Check recipe for patched and unpatched CVEs
> > 0139: """
> > 0140: from oe.cve_check import get_patched_cves
> > 0141:
> > *** 0142: with bb.utils.fileslocked([d.getVar("CVE_CHECK_DB_FILE_LOCK")=
],
> > shared=3DTrue):
> > 0143: if os.path.exists(d.getVar("CVE_CHECK_DB_FILE")):
> > 0144: try:
> > 0145: patched_cves =3D get_patched_cves(d)
> > 0146: except FileNotFoundError:
> > File: '/usr/lib/python3.8/contextlib.py', lineno: 240, function: helper
> > 0236: <cleanup>
> > 0237: """
> > 0238: @wraps(func)
> > 0239: def helper(*args, **kwds):
> > *** 0240: return _GeneratorContextManager(func, args, kwds)
> > 0241: return helper
> > 0242:
> > 0243:
> > 0244:def asynccontextmanager(func):
> > File: '/usr/lib/python3.8/contextlib.py', lineno: 83, function: __init_=
_
> > 0079:class _GeneratorContextManagerBase:
> > 0080: """Shared functionality for @contextmanager and @asynccontextmana=
ger."""
> > 0081:
> > 0082: def __init__(self, func, args, kwds):
> > *** 0083: self.gen =3D func(*args, **kwds)
> > 0084: self.func, self.args, self.kwds =3D func, args, kwds
> > 0085: # Issue 19330: ensure context manager instances have good docstri=
ngs
> > 0086: doc =3D getattr(func, "__doc__", None)
> > 0087: if doc is None:
> > Exception: TypeError: fileslocked() got an unexpected keyword argument =
'shared'
> > ERROR: Logfile of failure stored in:
> > /tmp/workspace.4jc1Y12y3W/build/tmp-newlib/work/i586-yocto-elf/zephyr-p=
hilosophers/3.1.0+gitAUTOINC+2ddd73feaf_5f86244bad-r0/temp/log.do_cve_check=
.433603
> > NOTE: recipe zephyr-philosophers-3.1.0+gitAUTOINC+2ddd73feaf_5f86244bad=
-r0:
> > task do_cve_check: Failed
> > ERROR: Task (/tmp/workspace.4jc1Y12y3W/oe-core/../meta-zephyr/meta-zeph=
yr-core/recipes-kernel/zephyr-kernel/zephyr-philosophers.bb:do_cve_check)
> > failed with exit code '1'
> >=20
>=20
> This is a mismatch with bitbake, because one commit hasn't reached 2.0.
> Steve, should I be using
> https://git.openembedded.org/bitbake-contrib/log/?h=3Dstable/2.0-nut for
> testing?

I've gone ahead and backported that bitbake change to make things
easier for people.

Cheers,

Richard


