Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web11.112601.1597936514024245511
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2020 08:15:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sidebranch-com.20150623.gappssmtp.com header.s=20150623 header.b=Aqg94yuD;
 spf=softfail (domain: sidebranch.com, ip: 209.85.219.68, mailfrom: leon@sidebranch.com)
Received: by mail-qv1-f68.google.com with SMTP id r19so1039587qvw.11
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2020 08:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m0DBFYKQ64Y4efFyeU/pLF9fZ6LMejDuS5M6+0p7nn4=;
        b=Aqg94yuDlKvC2ZgPmPfXJlOjvbn5l7TqFDZ3ddSkTrY/MdmLluuh9jgKtiWp9sGlSd
         RnEq40mljZHcqCTpEJvNgaMqkd0W0ch55JocFM32CshsOjUWR++TwUV81/bzRC0icj4L
         wGW/A/tiCYZGrJxVj+Soc69S0Q1uSEF+wUWqOIxvu1oKYZLYwQj6v7+/iPw6tXhlRb67
         qKtu8XiSD2ND4Lqm8KkMnGRJNMBoFmd6//pAVB//dUZ2VhnbXuvyoclkaYei16cvyYGX
         ACAd/jxTX3iPU0EC3PHBmnope9QEfp513UQRckj9TYqu3CP58niQ6vT8HOmJpQOWnrkm
         3BoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m0DBFYKQ64Y4efFyeU/pLF9fZ6LMejDuS5M6+0p7nn4=;
        b=r4Kq3fq3yGvas7oykH6A6M2YPKHJjVDF16r7wmNzbZEsA5JHvKEHy+JR0jlcn773vV
         LULvNXJUrE2gR2ZrMGqhWCrLdn5TSbgf5FizcK3r19TmVgsUqpssHbrP+c/eE1thpBWu
         KADrLgNJfRl4A52p/4R53bWQVtO/Ouy1ACtzhf/InYz78Tap5v1DZ3AjmZkHM1xfMZrJ
         mvarwDnrng4sIhtn7vicwBPcYbKdRFMkf40Uo6bEZ0g0LfAIOZxQX0ajhwUlPaE/d9+y
         g+T9fZSOoxxa26jNAk9ZLFklidhXYkG9798/N0mPuKClx032rQ9EGIK0+nEFJ2eScCuJ
         RDZg==
X-Gm-Message-State: AOAM530uBmTK6he0mTRBxSiu0C1AmI3Px+siHngF7THyHHBjqeaGEk5I
	IAJ96+aTJecwzO9B4DlMsN0Z+9rTLnRtBcjDpQAMQA==
X-Google-Smtp-Source: ABdhPJx38tU3T47T+F0vIfr6cyFs+2Jt+NbNmYOi41zfUObtUklXN9b8sYKuKY+GC0MHXeloA3frD7kEqQUeS3tQx00=
X-Received: by 2002:a0c:f702:: with SMTP id w2mr3321660qvn.152.1597936513058;
 Thu, 20 Aug 2020 08:15:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200820065727.2589128-1-raj.khem@gmail.com> <20200820065727.2589128-2-raj.khem@gmail.com>
 <162CF9C651AD323D.19371@lists.openembedded.org>
In-Reply-To: <162CF9C651AD323D.19371@lists.openembedded.org>
From: "Leon Woestenberg" <leon@sidebranch.com>
Date: Thu, 20 Aug 2020 17:15:00 +0200
Message-ID: <CAMjhiJi9LnojrDuFghYsac99Zna4E9S39j4+kDJ-hs7HbtJ0EA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/4] gcc-cross-canadian: Install gcc/g++ wrappers for musl
To: Leon Woestenberg <leon@sidebranch.com>
Cc: Khem Raj <raj.khem@gmail.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

With the rm -f $d/$p added, the links generated earlier are first
removed, then replaced by the wrapper, as expected.
We have tested this to work correctly.

(This fixes the bug where the first echo ... > would write to the
softlink target, the actual gcc binary.)

This is what I have locally in my meta-fixes overlay:

meta-fixes/recipes-devtools/gcc/gcc-cross-canadian_%.bbappend:
do_install_append () {
       for i in linux ${CANADIANEXTRAOS}
       do
               for v in ${CANADIANEXTRAVENDOR}
               do
                       d=${D}${bindir}/../${TARGET_ARCH}$v-$i
                       install -d $d
                       for j in ${TARGET_PREFIX}gcc${EXEEXT}
${TARGET_PREFIX}g++${EXEEXT}
                       do
                               p=${TARGET_ARCH}$v-$i-`echo $j | sed -e
s,${TARGET_PREFIX},,`
                               case $i in
                               *musl*)
                                       # %d/$p is a link to the
compiler, if we redirect output to it, the target will be overwritten
                                       rm -f $d/$p
                                       echo "#!/usr/bin/env sh" > $d/$p
                                       echo "exec \`dirname
\$0\`/../${TARGET_SYS}/$j -mmusl \$@" >> $d/$p
                                       chmod 0755 $d/$p
                                       ;;
                               esac
                       done
               done
       done
}

Regards.

Leon.
