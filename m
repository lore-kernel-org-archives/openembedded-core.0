Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web09.3198.1613534456388848787
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 20:00:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OX3g6uWO;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: idadelm@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id h125so131681lfd.7
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 20:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5ADBBd04CTBeHCFYbqaMnm2qFC7Z5+6xDJwv0KXfpFg=;
        b=OX3g6uWOSKDg0ITRz2NcJAsDZ/HCLU2KTfnRkV5rDzmPgp+3aLFUdRfhfmLNGjMylk
         d15QjcNp10uIvlDE/c62cBLXqLAg1ZzN4V/SMwx8nBPuhUnVy4xKodpGGJLqwT2OPJyx
         ZkbKr7nGXBRgXeAXODAzQCKT0vPxBg2IWOutfM0YdKkNndAPKiD1+zHIpvpnk6V0Gt3T
         U19Bhi58Pavts76RXTSfnCl/eysIYfc/pElaG5tZ4GFX+rQQ5cxMya7XyK2U0NaN39ac
         0JspTukBLBSJQvu8XHTouKhzv+2mucQPp7Ue1E89Y1oy7zwpA8y8hvcqHbu4vAlG56UA
         S2Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5ADBBd04CTBeHCFYbqaMnm2qFC7Z5+6xDJwv0KXfpFg=;
        b=r81jfJD/wG5SOEe7L+/UJxSdz4tEnO/2nNs+haJESo2nBltOuox0mNVf4ooFC6jrYc
         3G7i6mwBoQ1GSkXdHvxsu+4f4woHGcgz6ADYH9EMRQeSNBJhpyg7zJwTuzYcKs32Qkju
         C77ovquJ/W+NpwzaczJ/875yJCLXC6yovADFyumojw5MujsH71NWqvo6uWbIj+3AU5Rx
         Z676XVgMEkl6FSBfBUyvd3NIOAcXs026c7Xlya9xShyrvFs7cwekG8vAbkbtGNDE+5YM
         j/DZY4B0WuATA9nsIyCfmrt38vRoQh8BCux/w8cVryHI3L3xG3XHqN6JPHZmvsg3NP2F
         Hzvg==
X-Gm-Message-State: AOAM5304PJb9VQNKxnwYx5yerVMaq1R0a6DuRo7NOir3jkj4dNcW1vmV
	DYEMzuVqxE7UPFGB+N8Ukl/0F6yM3oXcFA==
X-Google-Smtp-Source: ABdhPJyJdKTnymA+Q3jwoB+tKEXVglGD6jBq8HRXVRs8iFEgiFQzKJrllIjUe9lsIvR4VLXOWEo0MA==
X-Received: by 2002:a19:e85:: with SMTP id 127mr13872987lfo.292.1613534454135;
        Tue, 16 Feb 2021 20:00:54 -0800 (PST)
Return-Path: <idadelm@gmail.com>
Received: from localhost.localdomain ([129.0.101.17])
        by smtp.gmail.com with ESMTPSA id 5sm101464lff.176.2021.02.16.20.00.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 20:00:53 -0800 (PST)
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [poky-contrib][RFC PATCH 0/5] Suggestions for improvements?
Date: Wed, 17 Feb 2021 05:00:28 +0100
Message-Id: <20210217040033.21541-1-idadelm@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello everyone,

The following patchset is aimed at improving the Yocto Project license tracing.

Initially, after a build I will come across 130 license warnings with some false positives. I got rid of these by replacing "or-later" with "+" for source licenses (computedpkglics) and also passing the recipe license through canonical_license of license.py(). As a result, some of the licenses will match during comparism hence some warnings eliminate.

Though some false positive warnings were eliminated, lots of warnings were ouputed as a result of several source licenses having "WITH Linux-syscall-note". With the help of a variable being set in local.conf, one can chooses whether or not to get lid of the "WITH Linux-syscall-note" string from the source licenses. Just by doing this, several warnings are dropped and now left with 118.

I later on added some logic depending on "source_spdx_license" variable whether or not for the user to allow the warnings being outputed during the build. It reduces the extra processing and reduces time if the user chooses not to display warnings. It uses bb.utils.contains() to find out if that particular vaiable is present. Also, I added package_qa_handle_error() to allow the user decide whether they want the issues treated as warnings, errors or not at all.

Some of the license-related logic I added to take care of splitting recipe licences before canonicalizing, getting rid of "or-later" warnings, I moved it to license.bbclass and put it in functions. I also plan on fixing the variable naming since some have underscores whereas others do not have. However, I will love to move more license logic in package.bbclass to license.bbclass but I need help with the right way to go about it. Also, general suggestions on any improvements to this are highly welcomed.

Cheers,
Ida.

Ida Delphine (5):
  package: Remove false positive lic warnings
  package: Remove false positive lic warnings
  package: Remove false positive lic warnings
  license.bbclass: Add functions to split and canonicalise license
    strings
  package.bbclass: Remove false positive license warnings

 meta/classes/license.bbclass |  27 ++++++++
 meta/classes/package.bbclass | 127 +++++++++++++++++++----------------
 2 files changed, 96 insertions(+), 58 deletions(-)

-- 
2.25.1

