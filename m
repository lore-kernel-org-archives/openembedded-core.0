Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.15004.1631447209727690666
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Sep 2021 04:46:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e0BGTmZ3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id d6so9975034wrc.11
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Sep 2021 04:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=o+tWB2vw8BCLcUIAYaQrrAH7cK6oa2+ktsCRZKkeYdI=;
        b=e0BGTmZ3NwpIqBzDHaBaHJhinkRJqyVrLA13dbz13r8z+pkud60LOidX30joya8jVv
         vsEqPNdH22o2Rf71OpdjwHUXvL/psY2yGl4O+lSLN49UaCDZiwhOYAIW8W9yGis+BE7r
         vUyLAVfn1eyAKvXkaWrG2V37w3qJleZJPfOEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=o+tWB2vw8BCLcUIAYaQrrAH7cK6oa2+ktsCRZKkeYdI=;
        b=d/57WcVeCgkUI37QnegiIVnjB26OPgfFPk27J8xcAaOFQCvH+AMxEC/HDBuOku9AAO
         53MphmAaZyBGTl+ItQ/pKm5GGAwQKiq5Kiv8I0qS60TT0AGnaPcSZDv0QeeOcCeecRO2
         yPa4xODdvC4h8+rmqI0BsEF2MRjIlSLz73dhRZmhiQbIJHy7PcK8cj0c8XnGwq0YzNDm
         QwOmdd3II5IQIpo43mTYYw17NxkoNeAnZayu1FgRh70n9gXzzF6dWQC4qI3pUcRgDGFh
         dl6GvrHbpsUp6Heaoydz/nQaCQtuPAjdaQ/RXXcL9YG18VuZo52LYq1bdNbx08E2EUBf
         nMSg==
X-Gm-Message-State: AOAM531rGDwG4H44n+hexrkxgSkCW0gj2a+yIE3R5a+hMtECRJ/1Rs9a
	6Kw/nN6bnnfUgtJY1r4jJyE2HnwWBuYc2mp5
X-Google-Smtp-Source: ABdhPJxjt31urwNNlPwPZzpIZ9tee/6w90T6TpqADGuEQbvmiwZSUR0RQNEmJpStdScZXUv3ZJrd5Q==
X-Received: by 2002:adf:80c8:: with SMTP id 66mr7344894wrl.65.1631447207991;
        Sun, 12 Sep 2021 04:46:47 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:65df:1d9c:d97e:b357? ([2001:8b0:aba:5f3c:65df:1d9c:d97e:b357])
        by smtp.gmail.com with ESMTPSA id t9sm4447801wrg.4.2021.09.12.04.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Sep 2021 04:46:47 -0700 (PDT)
Message-ID: <0b6111c1d71f1665cacafafaea972e609a77a0cd.camel@linuxfoundation.org>
Subject: Public project sstate/hash equivalence mirror now live
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Joshua Watt <JPEWhacker@gmail.com>, Michael Halstead
	 <mhalstead@linuxfoundation.org>
Date: Sun, 12 Sep 2021 12:46:46 +0100
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

We made the autobuilder sstate public a while ago but it wasn't useful after we
switched to hash equivalence by default. I'm pleased to be able to report that
we now have a read-only public server for the hash equivalence. We did have to
fix a small API omission and a couple of sstate related bugs but I'm pleased to
be able to report it is now operational and usable. An example config would be:

SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/dev/PATH;downloadfilename=PATH"
BB_HASHSERVE_UPSTREAM = "typhoon.yocto.io:8687"

I've included an example image build below where it took 11 minutes for a 
core-image-minimal image build. Obviously this is only of benefit if you're
building configurations that match the project autobuilder although hash
equivalence could be useful alone in reducing some build times.

I have updated the local.conf sample file in poky to match the new release.
We're not widely highlighting that information as yet as it remains to be seen
how well it scales and what the hosting impacts for it will look like but it is
there to experiment with to a wider audience such as this list.

The builds will sit for a long time whilst it queries hash equivalency and I
appreciate the UI feedback could be better there but one step at a time!

Cheers,

Richard

$ time bitbake core-image-minimal
Loading cache: 100% |                                                                                                                                                       | ETA:  --:--:--
Loaded 0 entries from dependency cache.
Parsing recipes: 100% |######################################################################################################################################################| Time: 0:00:03
Parsing of 871 .bb files complete (0 cached, 871 parsed). 1519 targets, 49 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "ubuntu-20.04"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-89e48765083f15bf79839a778d08a68f8aece51d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
meta-selftest        = "master:89e48765083f15bf79839a778d08a68f8aece51d"

Initialising tasks: 100% |###################################################################################################################################################| Time: 0:03:40
Checking sstate mirror object availability: 100% |###########################################################################################################################| Time: 0:00:28
Sstate summary: Wanted 1525 Local 0 Network 1515 Missed 10 Current 0 (99% match, 0% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3913 tasks of which 3603 didn't need to be rerun and all succeeded.

real	11m2.578s
user	0m42.927s
sys	0m9.963s



