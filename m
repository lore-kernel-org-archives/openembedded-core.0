Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web09.23950.1621867042418164137
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 May 2021 07:37:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aSwEdzPh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id z85-20020a1c7e580000b029017a76f3afbaso8560003wmc.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 May 2021 07:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=KU9YZIhH8M5vAlSAWUxDDhD3ITqELB6K6ikxoJE2fWM=;
        b=aSwEdzPhgVm6mb1PMbx+It2fUASmZzFRjknRwytj1LFhWMrkAcS/OKOV21uOSR+mvP
         zPcgk4QbyUbNad0teb1qcc+w0RneFP3nYU4SWA1YcECN7b2zULuRtMBWZwDmrTlrf0Wk
         k07UuWz8OS8n2MQO8zQ8vOAWFrdbZegfxFycU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=KU9YZIhH8M5vAlSAWUxDDhD3ITqELB6K6ikxoJE2fWM=;
        b=KogZNmGF8AT9FaAPhJLxN0YZfWS4WYKuSidab7y1hes/X3L8ApvYYE5J0YilHsx0Aj
         Kfzy1PCvQgL3dfOLWW+rtkFEZeUsfnQAmo1UepLiTpQCXIWwr6ubibOK7IsEpckk1I9V
         a+aSB9l7tygBHJRBjCPvCkvx66eAaH1+oWnf2qMTmoIYVsg5wR+XlKxI29kKyVgHvFM+
         NZsTyS/9Qt0SFWOv1Xp5hHojSwhvO9wI+ttR4KJc/TzBTn4ydP/d3Vc/Hv3KJib4FHi9
         +jVBNpK3TCvclKwZ7C2V7OYlNRSac3BPfgYkAUJLbRoIoCPn59lztsK/2uOafTU7dk24
         5riQ==
X-Gm-Message-State: AOAM533hfrwapBpAJt6rcMeY06yZ6yvFuA8PD81dpbcaPG9/PPuMdHo2
	nJUxOJR4A93EBI2ad0Jfj3vraw==
X-Google-Smtp-Source: ABdhPJwZ5UNvGFbV3VXYTMuVBxwSaIlG+AhQ5n3UkhGWRA2P3LfpeEMlGKU0vrEHVQJcW5lNgwkvsw==
X-Received: by 2002:a1c:5982:: with SMTP id n124mr19633665wmb.33.1621867040955;
        Mon, 24 May 2021 07:37:20 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:24b7:498a:7bdf:2361? ([2001:8b0:aba:5f3c:24b7:498a:7bdf:2361])
        by smtp.gmail.com with ESMTPSA id y20sm198622wmi.0.2021.05.24.07.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 07:37:20 -0700 (PDT)
Message-ID: <1f88aac4b0f11378a24dcfcfe2f7d4a09162d22f.camel@linuxfoundation.org>
Subject: Re: [dunfell][openembedded]pseudo updates breaks my custom recipe in Jenkins pipeline docker container
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Chencheng Zhang <chencheng@wittra.se>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 24 May 2021 15:37:19 +0100
In-Reply-To: <CAE5diG0ZuYyZ3mX+UTVrD-OPKXNuRhaVUVbwTfR=0xgHKWjEig@mail.gmail.com>
References: 
	<CAE5diG0ZuYyZ3mX+UTVrD-OPKXNuRhaVUVbwTfR=0xgHKWjEig@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-05-24 at 15:46 +0200, Chencheng Zhang wrote:
> 
> I don't have any problem building the recipe on my local Ubuntu. But on our Jenkins pipeline
> docker container (UID 111 GID 113), it complains:
> > 18:58:46  | ERROR: 'python3 setup.py install --root=/var/lib/jenkins/workspace/_build-system_bug-oecore-
> > bisect5/build/tmp-glibc/work/aarch64-wittra-linux/python3-bluepy/1.3.0-r0/image     --prefix=/usr     --
> > install-lib=/usr/lib/python3.8/site-packages     --install-data=/usr/share' execution failed.
> > 18:58:46  | WARNING: exit code 1 from a shell command.
> > 18:58:46  | ERROR: Execution of '/var/lib/jenkins/workspace/_build-system_bug-oecore-bisect5/build/tmp-
> > glibc/work/aarch64-wittra-linux/python3-bluepy/1.3.0-r0/temp/run.do_install.1587527' failed with exit code
> > 1:
> > 18:58:46  | running build
> > 18:58:46  | running build_py
> > 18:58:46  | Working dir is /var/lib/jenkins/workspace/_build-system_bug-oecore-bisect5/build/tmp-
> > glibc/work/aarch64-wittra-linux/python3-bluepy/1.3.0-r0/bluepy-1.3.0
> > 18:58:46  | execute make -C ./bluepy clean
> > 18:58:46  | execute make -C bluepy -j1
> > 18:58:46  | Failed to compile bluepy-helper. Exiting install.
> > 18:58:46  | Command was 'make -C bluepy -j1' in /var/lib/jenkins/workspace/_build-system_bug-oecore-
> > bisect5/build/tmp-glibc/work/aarch64-wittra-linux/python3-bluepy/1.3.0-r0/bluepy-1.3.0
> > 18:58:46  | Return code was 2
> > 18:58:46  | Output was:
> > 18:58:46  | b"make: Entering directory '/var/lib/jenkins/workspace/_build-system_bug-oecore-
> > bisect5/build/tmp-glibc/work/aarch64-wittra-linux/python3-bluepy/1.3.0-r0/bluepy-1.3.0/bluepy'\ntar xzf
> > bluez-src.tgz\ntar: ./bluez-5.47/AUTHORS: Cannot change ownership to uid 1000, gid 1000: Operation not
> > permitted\ntar: ./bluez-5.47/COPYING.LIB: Cannot change ownership to uid 1000, gid 1000: Operation not
> > permitted\ntar: ./bluez-5.47/config.h: Cannot change ownership to uid 1000, gid 1000: Operation not
> > permitted\ntar: ./bluez-5.47/src/shared/mgmt.h: Cannot change ownership to uid 1000, gid 1000: Operation
> > not
> > permitted\ntar: ./bluez-5.47/src/shared/gap.h: Cannot change ownership to uid 1000, gid 1000: Operation
> > not
> > permitted\ntar: ./bluez-5.47/src/shared/btsnoop.h: Cannot change ownership to uid 1000, gid 1000:
> > Operation
> > not permitted\ntar: ./bluez-5.47/src/shared/io-glib.c: Cannot change ownership to uid 1000, gid 1000:
> > Operation not permitted\ntar: ./bluez-5.47/src/shared/uhid.h: Cannot change ownership to uid 1000, gid
> > 1000:
> > Operation not permitted\ntar: ./bluez-5.47/src/shared/util.h: Cannot change ownership to uid 1000, gid
> > 1000:
> > Operation not permitted\ntar: ./bluez-5.47/src/shared/timeout.h: Cannot change ownership to uid 1000, gid
> > 1000: Operation not permitted\ntar: ./bluez-5.47/src/shared/hci-crypto.h: Cannot change ownership to uid
> > 1000, gid 1000: Operation not permitted\ntar: ./bluez-5.47/src/shared/gatt-db.h: Cannot change ownership
> > to
> > uid 1000, gid 1000: Operation not permitted\ntar: ./bluez-5.47/src/shared/io.h: Cannot change ownership to
> > uid 1000, gid 1000: Operation not permitted\ntar: ./bluez-5.47/src/shared/ad.h: Cannot change ownership to
> > uid 1000, gid 1000: Operation not permitted\ntar: ./bluez-5.47/src/shared/mainloop.h: Cannot change
> > ownership to uid 1000, gid 1000: Operation not permitted\ntar: ./bluez-5.47/src/shared/pcap.h: Cannot
> > change
> > ownership to uid 1000, gid 1000: Operation not permitted\ntar: ./bluez-5.47/src/shared/ringbuf.h: Cannot
> > change ownership to uid 1000, gid 1000: Operation not permitted\ntar: ./bluez-5.47/src/shared/crypto.c:
> > Cannot change ownership to uid 1000, gid 1000: Operation not permitted\ntar: ./bluez-
> > 5.47/src/shared/crypto.h: Cannot change ownership to uid 1000, gid 1000: Operation not permitted\ntar:
> > ./bluez-5.47/src/shared/queue.c: Cannot change ownership to uid 1000, gid 1000: Operation not
> > permitted\ntar: ./bluez-5.47/src/shared/hci.h: Cannot change ownership to uid 1000, gid 1000: Operation
> > not
> > permitted\ntar: ./bluez-5.47/src/shared/util.c: Cannot change ownership to uid 1000, gid 1000: Operation
> > not
> > permitted\ntar: ./bluez-5.47/src/shared/tty.h: Cannot change ownership to uid 1000, gid 1000: Operation
> > not
> > permitted\ntar: ./bluez-5.47/src/shared/queue.h: Cannot change ownership to uid 1000, gid 1000: Operation
> > not permitted\ntar: ./bluez-5.47/src/shared/att-types.h: Cannot change ownership to uid 1000, gid 1000:
> > Operation not permitted\ntar: ./bluez-5.47/src/shared/timeout-glib.c: Cannot change ownership to uid 1000,
> > gid 1000: Operation not permitted\ntar: ./bluez-5.47/src/shared/gatt-server.h: Cannot change ownership to
> > uid 1000, gid 1000: Operation not permitted\ntar: ./bluez-5.47/src/shared/att.h: Cannot change ownership
> > to
> > uid 1000, gid 1000: Operation not permitted\ntar: ./bluez-5.47/src/shared/hfp.h: Cannot change ownership
> > to
> > uid 1000, gid 1000: Operation not permitted\ntar: ./bluez-5.47/src/shared/tester.h: Cannot change
> > ownership
> > to uid 1000, gid 1000: Operation not permitted\ntar: ./bluez-5.47/src/shared/mgmt.c: Cannot change
> > ownership
> > to uid 1000, gid 1000: Operation not permitted\ntar: ./bluez-5.47/src/shared/ecc.h: Cannot change
> > ownership
> > to uid 1000, gid 1000: Operation not permitted\ntar: ./bluez-5.47/src/shared/att.c: Cannot change
> > ownership
> > to uid 1000, gid 1000: Operation not permitted\ntar: ./bluez-5.47/src/shared/gatt-helpers.h: Cannot change
> > ownership to uid 1000, gid 1000: Operation not permitted\ntar: ./bluez-5.47/src/shared/gatt-client.h:
> > Cannot
> > change ownership to uid 1000, gid 1000: Operation not permitted\ntar: ./bluez-5.47/src/shared: Cannot
> > change
> > ownership to uid 1000, gid 1000: Operation not permitted\ntar: ./bluez-5.47/src/log.c: Cannot change
> > ownership to uid 1000, gid 1000: Operation not permitted\ntar: ./bluez-5.47/src/log.h: Cannot change
> > ownership to uid 1000, gid 1000: Operation not permitted\ntar: ./bluez-5.47/src: Cannot change ownership
> > to
> > uid 1000, gid 1000: Operation not permitted\ntar: ./bluez-5.47/COPYING: Cannot change ownership to uid
> > 1000,
> > gid 1000: Operation not permitted\ntar: ./bluez-5.47/btio/btio.h: Cannot change ownership to uid 1000, gid
> > 1000: Operation not permitted\ntar: ./bluez-5.47/btio/btio.c: Cannot change ownership to uid 1000, gid
> > 1000:
> > Operation not permitted\ntar: ./bluez-5.47/btio: Cannot change ownership to uid 1000, gid 1000: Operation
> > not permitted\ntar: ./bluez-5.47/lib/bnep.h: Cannot change ownership to uid 1000, gid 1000: Operation not
> > permitted\ntar: ./bluez-5.47/lib/mgmt.h: Cannot change ownership to uid 1000, gid 1000: Operation not
> > permitted\ntar: ./bluez-5.47/lib/sdp.c: Cannot change ownership to uid 1000, gid 1000: Operation not
> > permitted\ntar: ./bluez-5.47/lib/rfcomm.h: Cannot change ownership to uid 1000, gid 1000: Operation not
> > permitted\ntar: ./bluez-5.47/lib/bluetooth.h: Cannot change ownership to uid 1000, gid 1000: Operation not
> > permitted\ntar: ./bluez-5.47/lib/hci.c: Cannot change ownership to uid 1000, gid 1000: Operation not
> > permitted\ntar: ./bluez-5.47/lib/l2cap.h: Cannot change ownership to uid 1000, gid 1000: Operation not
> > permitted\ntar: ./bluez-5.47/lib/hci_lib.h: Cannot change ownership to uid 1000, gid 1000: Operation not
> > permitted\ntar: ./bluez-5.47/lib/sdp_lib.h: Cannot change ownership to uid 1000, gid 1000: Operation not
> > permitted\ntar: ./bluez-5.47/lib/hidp.h: Cannot change ownership to uid 1000, gid 1000: Operation not
> > permitted\ntar: ./bluez-5.47/lib/uuid.c: Cannot change ownership to uid 1000, gid 1000: Operation not
> > permitted\ntar: ./bluez-5.47/lib/uuid.h: Cannot change ownership to uid 1000, gid 1000: Operation not
> > permitted\ntar: ./bluez-5.47/lib/sdp.h: Cannot change ownership to uid 1000, gid 1000: Operation not
> > permitted\ntar: ./bluez-5.47/lib/hci.h: Cannot change ownership to uid 1000, gid 1000: Operation not
> > permitted\ntar: ./bluez-5.47/lib/bluetooth.c: Cannot change ownership to uid 1000, gid 1000: Operation not
> > permitted\ntar: ./bluez-5.47/lib/cmtp.h: Cannot change ownership to uid 1000, gid 1000: Operation not
> > permitted\ntar: ./bluez-5.47/lib/sco.h: Cannot change ownership to uid 1000, gid 1000: Operation not
> > permitted\ntar: ./bluez-5.47/lib/amp.h: Cannot change ownership to uid 1000, gid 1000: Operation not
> > permitted\ntar: ./bluez-5.47/lib/a2mp.h: Cannot change ownership to uid 1000, gid 1000: Operation not
> > permitted\ntar: ./bluez-5.47/lib: Cannot change ownership to uid 1000, gid 1000: Operation not
> > permitted\ntar: ./bluez-5.47/attrib/gatt.c: Cannot change ownership to uid 1000, gid 1000: Operation not
> > permitted\ntar: ./bluez-5.47/attrib/att-database.h: Cannot change ownership to uid 1000, gid 1000:
> > Operation
> > not permitted\ntar: ./bluez-5.47/attrib/utils.c: Cannot change ownership to uid 1000, gid 1000: Operation
> > not permitted\ntar: ./bluez-5.47/attrib/gattrib.h: Cannot change ownership to uid 1000, gid 1000:
> > Operation
> > not permitted\ntar: ./bluez-5.47/attrib/gatt.h: Cannot change ownership to uid 1000, gid 1000: Operation
> > not
> > permitted\ntar: ./bluez-5.47/attrib/gatttool.h: Cannot change ownership to uid 1000, gid 1000: Operation
> > not
> > permitted\ntar: ./bluez-5.47/attrib/gattrib.c: Cannot change ownership to uid 1000, gid 1000: Operation
> > not
> > permitted\ntar: ./bluez-5.47/attrib/att.h: Cannot change ownership to uid 1000, gid 1000: Operation not
> > permitted\ntar: ./bluez-5.47/attrib/gatt-service.h: Cannot change ownership to uid 1000, gid 1000:
> > Operation
> > not permitted\ntar: ./bluez-5.47/attrib/att.c: Cannot change ownership to uid 1000, gid 1000: Operation
> > not
> > permitted\ntar: ./bluez-5.47/attrib: Cannot change ownership to uid 1000, gid 1000: Operation not
> > permitted\ntar: ./bluez-5.47/sys/bluetooth/bluetooth.h: Cannot change ownership to uid 1000, gid 1000:
> > Operation not permitted\ntar: ./bluez-5.47/sys/bluetooth/hci.h: Cannot change ownership to uid 1000, gid
> > 1000: Operation not permitted\ntar: ./bluez-5.47/sys/bluetooth: Cannot change ownership to uid 1000, gid
> > 1000: Operation not permitted\ntar: ./bluez-5.47/sys: Cannot change ownership to uid 1000, gid 1000:
> > Operation not permitted\ntar: ./bluez-5.47: Cannot change ownership to uid 1000, gid 1000: Operation not
> > permitted\ntar: Exiting with failure status due to previous errors\nmake: *** [Makefile:33: bluez-
> > 5.47/lib/bluetooth.c] Error 2\nmake: Leaving directory '/var/lib/jenkins/workspace/_build-system_bug-
> > oecore-
> > bisect5/build/tmp-glibc/work/aarch64-wittra-linux/python3-bluepy/1.3.0-r0/bluepy-1.3.0/bluepy'\n"
> > 18:58:46  | WARNING: exit code 1 from a shell command.
> > 
> 
> 
> I agree that this library is pretty badly written and has a bluez tarball in its source code.
> I have attached both the recipe and the Jenkins log.
> May I ask for your suggestions on how I can resolve this?


The issue is that after those patches, the source directory ${S} is not under pseudo 
control therefore changing the ownership of files there to root/root won't work.

Those files in ${S} shouldn't need to be owned by root/root so the fix is probably
to find out what is trying to change them and stop it.

Cheers,

Richard

