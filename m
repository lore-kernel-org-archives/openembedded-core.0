Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.9337.1597368009160796693
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2020 18:20:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CJ9NTqAn;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id a5so6917618wrm.6
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2020 18:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=ed8inzxe6N88RWvPoVspLSbDY35d7+Qx+FoQJiJTT9M=;
        b=CJ9NTqAnjyBPuGmGUuioKyGerICTsg+nOprEVYpaL/TFSUs/PRGZMXL0LsEiwIo+bh
         ASFrPIKuWxjza9cqPAyZ+lc8C2nPEQn7cG9ZIRvNETs4WVxzFPvRhG0gMl8F35exHe4f
         iuvqBgcWuAnf7bAuhw3nHcgtAwOYcK/LDTu/I1IQeNhhNpLkvF+HADFOouc7kw1GGoB3
         6Hz8+sJ9SkhOnx6r5z4inMuuww5Qq7H2CO/wtNW+zFC0frpII6obEK/Gpl+KYxSNNtof
         U9iapiKIGEecTqYyWfpajALv2x0nRJk3AXDDF8UtHpLZnH5sUJgSwHe+mc/JLq5wsrV4
         Ez2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=ed8inzxe6N88RWvPoVspLSbDY35d7+Qx+FoQJiJTT9M=;
        b=oB79nUEglfSC/X6346QMvmLesEV4U1iPxSNGtG0YnWDhE2YR5fn0R5FPUt7bJSuOpI
         baJi7LzUgLzTDu+g5ILIghZ6ouE96f2stZlBD3J08wc0THsrCLAewUsJ7T4EAudAjF7P
         cDvkKnDa0Gt+IJbNRntff1+iETDMSFo3WuM/vJGMXTYTI3yhPIHTMKBb+p99jOB8N8d6
         oqBGfDDldHQErLG9tPFn6oXjZ1e/Wfkq+CoX7EaDCwV+aS1fMk5ODXl89n38NP5NHt23
         rGCN8rhPVHVg9lj0NAWEyrFuCxcja98yYwLT1EKCOYcsck2xmp5rwsdZvS4aOIriTDuv
         OCyg==
X-Gm-Message-State: AOAM530PiAu1LmHClb1cQqzW37YsChTSsjRPA2mSSf078g9qQBc2eMj4
	D5PkoCObS+ui8EsgVDGZHXpag8ykNi/oo9R6KUKl0vGr
X-Google-Smtp-Source: ABdhPJwrs7JGDTPALdlMMuo8JTEQdGr6BM3CjrrnhrlidqGizd4ETBYQXiGuFXsSKtDmXthKQPueMNdtWc3LIgIUNAU=
X-Received: by 2002:a5d:63d1:: with SMTP id c17mr377657wrw.241.1597368007439;
 Thu, 13 Aug 2020 18:20:07 -0700 (PDT)
MIME-Version: 1.0
From: "Joshua Watt" <JPEWhacker@gmail.com>
Date: Thu, 13 Aug 2020 20:19:56 -0500
Message-ID: <CAJdd5Ga76MMFdjqU3tZ1-3RFYv-b5Fak0nSC+bmGjp70uhGtLg@mail.gmail.com>
Subject: Perl Storable.pm in non-arch directory (Bug #13946)
To: OE-core <openembedded-core@lists.openembedded.org>, 
	Steve Sakoman <steve@sakoman.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

I spent some time digging into the build failures that Steve
encountered ([1], [2]) when pulling in my patch to make the build fail
if Storable.pm wasn't place in an arch specific directory. As it turns
out, this may be a false alarm. I dug into the perl code and it
appears that this change [3] (introduced for 5.31.3) moved the
installation of Storable.pm from the base directory to the arch
specific one. By my reading of the code and empirical evidence of
diffing the build output, this happens because Storable.pm is no
longer explicitly listed to be installed as
'$(INST_ARCHLIB)/Storable.pm', and thus defaults to the arch-specific
directory. Practically speaking, I believe this means that dunfell
(with perl 5.30) should always have Storable.pm in the base lib
directory, whereas master (with perl 5.32) should always have
Storable.pm in the arch specific directory. I don't have any
conclusions about what this means about our intermittent bug, but at a
minimum I suspect my patch is not appropriate for dunfell.

[1] https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1245
[2] https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/1229
[3] https://github.com/Perl/perl5/commit/95173f94fe0c1b2b943af60e1f6c6e4c47b8a975#diff-03144331fb08a8b04b003b1a49659547L16
