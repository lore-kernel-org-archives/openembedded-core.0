Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web12.11197.1611663190490386635
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 04:13:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tDu+FIiu;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: andrey.z@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 3so19271701ljc.4
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 04:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=N1AMW6qzrLaBRfRRX/Ix1l6vFjS4dB6MpvNf7Fz7+SQ=;
        b=tDu+FIiukoKMJMdQeYfBDEDvomfVotKKZN59xrmBJK25YRKI04rJYdD2tXvi3y1DrY
         4OYjuU74LcZMt5FOL9+kq8lCXOHAKABmZormaIpnSTRcj2O5brreZEpyo60/OHsWdXWh
         hUMnzUQrPtzytFk8DH9uIvJAbvoKu3M3HFI58l/xIeGnrDRVPABIxDh807VnQgX5KuqO
         mk9rikYy0tt4qFNqWTMKq+IyYMmYzwM19EyjUnEqyiLdFZsZMqwNHVdBfEP2rn6PhhVB
         V5u2H0xZeMKXJ4rH9ehzlklTvFjCDm1+qsh4dGsNxWhTAEUueROSQq2NYpKh8VpYiig6
         wyrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=N1AMW6qzrLaBRfRRX/Ix1l6vFjS4dB6MpvNf7Fz7+SQ=;
        b=BdzyBe/thwxChon7rsKPTCvXug9c3BEJUR52qBaMEcxP9P2mryYJPl8W0C/EoGPtgy
         5EL3IsdaQB5HjJcOwhW68Mx0acxDrjnzv4jNvqipkCwj/mXLuejU97Jw9FExBtsgvMuN
         Pzcf39BdNfYbIvXX4HQDyM6U+58Ertp8UHBkYZfFJNrEsdNpqUzeBll7zmHPPKh+GLlZ
         FFutwuN7tWyVOa05scGPRs26gMPRhMswciwi+yBU4RA+GxCgdu6SFiCI47TWNSDfQjex
         TMj06EMJoG9jgjoAMBi/kS4XUDY4pUe4LvssZYckOXYccn3M0Qpfhx5/pcwcHq+qdqBX
         I2Rg==
X-Gm-Message-State: AOAM533j8xAeamhk/d7Vd0XrQNQmMadMXF7cPOd7jy4v/PlSJURXpPyN
	FA0XmiMpOchkvYN3mGubfF1b/ph6ulf2/9vB3SE=
X-Google-Smtp-Source: ABdhPJxjLrStNia6vn0b0aDniruqBzJJ4oGVc+/IYnUHFGzu8LHQ1bGDiyuI+cV2oYvF5Q0lL/Eq9esiAmCP8QFmLk4=
X-Received: by 2002:a2e:9ed5:: with SMTP id h21mr2777573ljk.125.1611663188596;
 Tue, 26 Jan 2021 04:13:08 -0800 (PST)
MIME-Version: 1.0
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Tue, 26 Jan 2021 13:12:57 +0100
Message-ID: <CAHtQpK71uAoq_hwDGJCvt5O_=kNXHkWFkmHC-BQkzcSCM3ys7A@mail.gmail.com>
Subject: [dunfell]: gpsd recipe (3.19) build is broken
To: Steve Sakoman <steve@sakoman.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hello Steve,

gpsd recipe build breaks on the dunfell branch with following error messages:

| /development/dunfell/build-output/work/aarch64-fsl-linux/gpsd/3.19-r0/recipe-sysroot-native/usr/bin/aarch64-fsl-linux/../../libexec/aarch64-fsl-linux/gcc/aarch64-fsl-linux/9.3.0/ld:
./libgpsd.a(ppsthread.o): undefined reference to symbol
'pthread_create@@GLIBC_2.17'
| /development/dunfell/build-output/work/aarch64-fsl-linux/gpsd/3.19-r0/recipe-sysroot-native/usr/bin/aarch64-fsl-linux/../../libexec/aarch64-fsl-linux/gcc/aarch64-fsl-linux/9.3.0/ld:
/development/dunfell/build-output/work/aarch64-fsl-linux/gpsd/3.19-r0/recipe-sysroot/lib/libpthread.so.0:
error adding symbols: DSO missing from command line

This cannot be reproduced on the current master branch, where the
version of gpsd recipe has been bumped up from 3.19 to 3.20.

Can you please consider to cherry-pick following commits from master
in order to upgrade the gspd version on dunfell branch:

98e61961c gpsd: add new init script
04afc692a gpsd: mark CLEANBROKEN
33a15c790 gpsd: fix build on aarch64
cecab9c4c gpsd: Upgrade 3.19 -> 3.20

I've tried to cherry-pick them locally and they do apply clean. Also
the build of gpsd is successful after this upgrade.

-- 
Regards,
Andrey.
