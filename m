Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26E60C48BF6
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 12:21:17 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.11662.1708518072585475516
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Feb 2024 04:21:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RAzWJhR0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33d568fbf62so1753469f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 04:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1708518071; x=1709122871; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=StwpiRK5p0aD0Lm6o7RoDJNW6kezSuymEdYR1G65e+4=;
        b=RAzWJhR0lHe6PtYurKrbirmm6S7daRBZXci42RIHgotcYE4mFcMXnj7RlVhr9HeyYW
         nxSd5eYNmwFg2XXNNbwqkTxji6RItoZ0mDjEfut76wIffH7ITTLzcO14kFNWQKCwuf9x
         uXCxWP7CvXomCP5D0RjPbCA4uGKK/z1d4T10I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708518071; x=1709122871;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=StwpiRK5p0aD0Lm6o7RoDJNW6kezSuymEdYR1G65e+4=;
        b=wWVpLYl13mH9zv8G+IL7KOmk8Qf6+kQNr6axCRBRV+GcYNit7haX6HdTOSFyltNRcO
         rE6zv/qD2v1hdrjmB32OtcaBJgyNJ/1aM7ihlPxIlJkHwKe7XK1u9LmsN1icUrUEqYtg
         LVmE0g8kxmlXgNpPdbVhYNpzhlv+eQIKc01AG7+i2zA4HEHzmpN4aFyLmx1akDMjwDlY
         x/Cn8T7O64peNV5VfZlf5BA8WTlFo7an3iP2NVDSpNFUOW+zr3Sw+JqzwnVcl3Tr9c+d
         z67zr+Xej1/JiyIu6lg7Er4LYQ1vcSdw8yzsOYscuU/EvkT6bJwMH4STOT6Z1h/K7Q9V
         rPUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTUAWcAtRJ7mdKpA4JVeyMrGybKlk4uWbsHpAT/U4mmwocHcAJ+DEQ5K1ZOaIHXn5sL1wUg/fqIfXCCT2NbCeyKl9YCshtwSIUoiheG4XkdW76SJooMV8X
X-Gm-Message-State: AOJu0YyLQVtPCOsZKZWo6qlbTgj1+yWc6fgmGgvL6HsayvgoC9qeOc9Q
	CxDgWv/X6hN3hDsgku22qoNnrj3bWhuh45FFhcmGQQA8X+i5jKzUn1ZcXBVDNgQ=
X-Google-Smtp-Source: AGHT+IHxAQtYdP5VKP3oClo6W7pkRwq7HSM10QlZ9+NspXMunCSzrsXipGy7GsNzdtWLWn9WDyhUzg==
X-Received: by 2002:adf:cb05:0:b0:33d:3896:be5f with SMTP id u5-20020adfcb05000000b0033d3896be5fmr6998010wrh.54.1708518070963;
        Wed, 21 Feb 2024 04:21:10 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:f7eb:cc84:5778:9052? ([2001:8b0:aba:5f3c:f7eb:cc84:5778:9052])
        by smtp.gmail.com with ESMTPSA id ba1-20020a0560001c0100b0033d67bdce97sm5980861wrb.84.2024.02.21.04.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 04:21:10 -0800 (PST)
Message-ID: <1af50ab4ad85f2298641c88f6d96d342cc0c2565.camel@linuxfoundation.org>
Subject: Re: [PATCH] rust: Oe-selftest error log on console when it fails.
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yash Shinde <Yash.Shinde@windriver.com>, Randy MacLeod
	 <randy.macleod@windriver.com>, openembedded-core@lists.openembedded.org
Cc: Umesh.Kallapa@windriver.com, Naveen.Gowda@windriver.com, 
 Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
 Joshua Watt <JPEWhacker@gmail.com>
Date: Wed, 21 Feb 2024 12:21:09 +0000
In-Reply-To: <3e26d31e-b8bd-4549-8c04-540dd36c2f69@windriver.com>
References: <20240213130404.3285564-1-Yash.Shinde@windriver.com>
	 <0a8900ca-34e0-4c2d-af94-bf6b54f18956@windriver.com>
	 <3e26d31e-b8bd-4549-8c04-540dd36c2f69@windriver.com>
Autocrypt: addr=richard.purdie@linuxfoundation.org; prefer-encrypt=mutual; keydata=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
 YNvg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 12:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195969

On Wed, 2024-02-21 at 13:30 +0530, Yash Shinde wrote:
>=20
> =C2=A0The runCmd() returns the 'Result' object containing information abo=
ut the command execution. It has the following attributes:
> =C2=A0=C2=A0=C2=A0 result.command =3D command
> =C2=A0=C2=A0=C2=A0 result.status =3D cmd.status
> =C2=A0=C2=A0=C2=A0 result.output =3D cmd.output
> =C2=A0=C2=A0=C2=A0 result.error =3D cmd.error
> =C2=A0=C2=A0=C2=A0 result.pid =3D cmd.process.pid
> =C2=A0https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/u=
tils/commands.py#n198
> =C2=A0=C2=A0
> =C2=A0I tried to capture the return object value (stderr i.e result.error=
) and print it to the terminal, but that didn't work as expected.
> =C2=A0Even I tried to print some debug statements in rust.py file and it =
also didn't show up in the terminal or in the summary.txt file.
> =C2=A0I assume there's something in oe-selftest framework that doesn't pr=
int statements directly.
> =C2=A0=C2=A0
> =C2=A0Also, I see there's a "output_log" parameter in the runCmd function=
 parameters, which I understand is used to redirect stdout of the
> =C2=A0command being executed. Currently, I am checking with different val=
ues by referring to other oe-selftests and their corresponding behavior wit=
h it.
> =C2=A0
>=20
>=20
>=20
> =C2=A0I am checking with some functions and procedures from unittest and =
subprocess.Popen frameworks to get the error logs:
> =C2=A0
>=20
>=20
>=20
> =C2=A0https://docs.python.org/3/library/unittest.html
> =C2=A0https://docs.python.org/3/library/subprocess.html#subprocess.Popen
> =C2=A0


I had a look at this and tried an experiment locally. This seemed to
work:

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/=
cases/rust.py
index 120be6454fa..ad14189c6df 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -216,13 +216,16 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, =
OEPTestResultTestCase):
             cmd =3D cmd + " export RUST_TARGET_PATH=3D%s/rust-targets;" % =
rustlibpath
             # Trigger testing.
             cmd =3D cmd + " export TEST_DEVICE_ADDR=3D\"%s:12345\";" % qem=
u.ip
-            cmd =3D cmd + " cd %s; python3 src/bootstrap/bootstrap.py test=
 %s --target %s > summary.txt 2>&1;" % (builddir, testargs, targetsys)
-            runCmd(cmd)
+            cmd =3D cmd + " cd %s; python3 src/bootstrap/bootstrap.py test=
 %s --target %s" % (builddir, testargs, targetsys)
+            retval =3D runCmd(cmd)
             end_time =3D time.time()
=20
+            resultlog =3D rustlibpath + "/results-log.txt"
+            with open(resultlog, "w") as f:
+                f.write(retval.output)
+
             ptestsuite =3D "rust"
-            self.ptest_section(ptestsuite, duration =3D int(end_time - sta=
rt_time), logfile =3D builddir + "/summary.txt")
-            filename =3D builddir + "/summary.txt"
-            test_results =3D parse_results(filename)
+            self.ptest_section(ptestsuite, duration =3D int(end_time - sta=
rt_time), logfile=3Dresultlog)
+            test_results =3D parse_results(resultlog)
             for test in test_results:
                 self.ptest_result(ptestsuite, test, test_results[test])


I'm fairly sure we could improve it further but this does start that
process.

Cheers,

Richard


