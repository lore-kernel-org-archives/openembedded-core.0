Return-Path: <viacheslav.volkov.1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33ECCEEEC21
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 06:02:58 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.67320.1726207369550259945
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Sep 2024 23:02:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hccTNn8x;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: viacheslav.volkov.1@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a83562f9be9so186412466b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 23:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726207368; x=1726812168; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJTDHGHJSBsMWeSHZny4wLj9MFsJJIheZXj2b1hp5Ic=;
        b=hccTNn8xgI0VIKLAIPmUmefORjdYGxPj+9o77XB3WCB8LduD+PT605wqY6VfeTtPgS
         cNgrov9dx3T0h09oFIKGJkS2ChC4J+HPbKeP4WBodJSKi40Lc07/0z1NWx2yk6OADSZ0
         0XzDVg7OMwxsZPX/lA/9c0qHxhIFWws5t4JcqjNo3ZKZyBaB9JJjMydqHKnjgvciEVaL
         EBJVy04ZJ5zkAraf/8kzpqmqy3zgM5ApY6HQLlOS9Hrp5IOsA8R8B57368f+j+Bjw6ba
         LLKrTbIXVNXyDoEjhU9kjDi30+fru/aBMgdVk2EKDvqieTsPkEP7DgarICdbN+7UPBIB
         OMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726207368; x=1726812168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJTDHGHJSBsMWeSHZny4wLj9MFsJJIheZXj2b1hp5Ic=;
        b=NP9EtwkjNNbxk5N2oiNP5b3jqy6CrQEU9iZH8HqjnaQtRJhmeemoWujH4gg29TLewc
         OQDxlUoYWlpLaHjdc7ksr3Rzol2eV1tLDsduwKJohYUyDoYEWN8XGZvBBP4eyaYPkLKo
         T32WM6K26pfDhHsiPHA9G9skGBmAz+UNynenBX3IRE3gwSQz0fzmK15EpTWM9wAtk4MD
         TMvis3ENdjybA8zTEorWGBUUZvg/CFtwNG7DsHZBbJmxthBj8O7ZcLhOALrxPp/sTpIA
         Egzvsb8xtcxcjkV8/6jZa6F1rWibJ9IcaU7TsiDFgCzJJEcGhjCMSG3TGCouVmdrPMat
         0KRQ==
X-Gm-Message-State: AOJu0YzSZKp3KOXS1DL9+Yfnx8FBDgTxINjCK8BCjh7//mewvqGTHYpF
	QM+A5hP+Zl012Y4jm8JqgXbekJ91fOsL+/98AhHWFpVjRuwEr2rY
X-Google-Smtp-Source: AGHT+IFbBPb8qgAIi3JLNn9I/bZ8yiOA4bR5qKU8UeAEFThBYG/MHKIf4+/RSJ1UWu5Ytg34ntsipA==
X-Received: by 2002:a17:907:d592:b0:a8a:8c92:1c9c with SMTP id a640c23a62f3a-a9029497cc3mr435327766b.29.1726207367627;
        Thu, 12 Sep 2024 23:02:47 -0700 (PDT)
Received: from localhost.localdomain ([178.134.179.97])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a8d25d29399sm827823166b.185.2024.09.12.23.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 23:02:47 -0700 (PDT)
From: Viacheslav Volkov <viacheslav.volkov.1@gmail.com>
To: Ross.Burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] initscripts: make populate-volatile.sh power-cut-save
Date: Fri, 13 Sep 2024 10:02:45 +0400
Message-ID: <20240913060245.377166-1-viacheslav.volkov.1@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <FED3C03A-0EF3-49C2-9D66-A89B161AF3A9@arm.com>
References: <FED3C03A-0EF3-49C2-9D66-A89B161AF3A9@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Sep 2024 06:02:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204470

Hi Ross,

> Doing a sync for _every_ file created seems like overkill, and if you're
> doing atomic creation is it even useful? The correct file will exist or not
> exist: what does a sync add?

sync is an important part of atomic file creation. It acts as a barrier and
prevents possible reordering on file system level. To demonstrate an issue
without sync I did the following experiment on my board with NAND flash
formatted as UBIFS (simulating populate-volatile.sh behavior):

ssh board "
  # some_file* don't exist at this moment.
  touch some_file.populate-volatile.tmp # created with default permissions: 644
  chmod 600 some_file.populate-volatile.tmp # update permissions
  # Note: there is no sync at this moment.
  mv some_file.populate-volatile.tmp some_file
  ls -l some_file* # Make sure we've updated permissions. Output:
  # -rw-------    1 root     root             0 Sep 13 08:36 some_file
"
sleep 5 # Give a board some time to write data to flash
        # (otherwise some_file* is not preserved at all in my case).
power_off_board.sh # Physically cut board's power.
sleep 15 # Keep the board off for some time..
power_on_board.sh # Turn board's power on, it starts booting automatically.
sleep 40 # Give a board time to boot
ssh board "
  ls -l some_file* # Output:
  # -rw-r--r--    1 root     root             0 Sep 13 08:36 some_file
"

Above we can observe some_file with wrong (default) permissions. Effect of
chmod has been lost due to power cut. Furthermore since some_file now exists,
it won't be processed by next populate-volatile.sh execution (after reboot) and
hence remains with wrong permissions forever. A behavior with ownership is the
same as with permissions in my case.

Additionally I'd like to quote UBIFS FAQ here (I've provided a link to it in
my patch):

> Changing a file atomically means changing its contents in a way that unclean
> reboots could not lead to any corruption or inconsistency in the file. The
> only reliable way to do this in UBIFS (and in most of other file-systems,
> e.g. JFFS2 or ext3) is the following:
>
> * make a copy of the file;
> * change the copy;
> * synchronize the copy;
> * re-name the copy to the file (using the rename() libc function or the mv
>   utility).
>
> Note, if a power-cut happens during the re-naming, the original file will be
> intact because the re-name operation is atomic. This is a POSIX requirement
> and UBIFS satisfies it.
>
> Often applications do not do the third step - synchronizing the copy.
> Although this is generally an application bug, the ext4 file-system has a
> hack which makes sure the data of the copy hits the disk before the re-name
> meta-data, which "fixes" buggy applications. However, UBIFS does not have
> this feature, although we plan to implement it.

I understand that sync implies some performance degradation but IMHO we should
prefer correctness over performance by default. I did some basic performance
experiments: time /etc/init.d/populate-volatile.sh
In my case I didn't notice any measurable difference in execution time with and
without sync command in populate-volatile.sh (22 files were created, which is
not that much, I agree..).

> (also: it's power-cut safe, not save)

Agree, it'd be better to fix it. I'll wait for further feedback before sending
a v2 patch with this fix..

Regards,
Viacheslav

