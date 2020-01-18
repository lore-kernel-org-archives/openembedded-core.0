Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id D50946C226
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2020 23:16:12 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p17so11122181wma.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2020 15:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=o41J1nvDncRHmzEHB8nPLdkT0oIahjSIcpr8/fSl8ys=;
	b=gF3+TnjWqFGCgqdZaztRQfxb6opIFl4MXpAlzK8qLJXsQ+AK6oS1AFrQiz11PeTgIQ
	q0mUVtYtZoyHssopM1QCALCcsQK+8u0BzzShSC+UNvmLfHKoi38kxAm3s7eZfLHL2YuR
	aE8jZSbhsYfHSucHiAHV44Duci61lRydpLk+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=o41J1nvDncRHmzEHB8nPLdkT0oIahjSIcpr8/fSl8ys=;
	b=aaWwHpW/DmCug9zEBH3coxJ3Pkj1FKA9x3fLJ4UXw1r5oUEw8hXd2sXkBJMG64JLEv
	tBsMm/2ckBlBbnapwNqyQ8R2+z1XaAoKQVIlJul1lNB/W2bmTa/2NUlHLac2U3f7Qw9I
	LJv4MOgD6YeKiu0BMMgcMrclTQrncN0vaMCv5s2Y+yt6sRz8E+IbUM5ljXrQ09EKuIEI
	VRSmpSC61zcDJvm6o/p6mKDD1uz8MZMCRQB7Pe/28ZwVPS7ld1n/3ybbR5tzKZnfilYT
	jFl0DZhTPOWVi3FZ9n/jzXzB+L4eJJZkCsfXOvgQmbB8DJZkFJZuie96nY2PO0r9HH+b
	rU6A==
X-Gm-Message-State: APjAAAV2q7+YEm8oufOslOv6mF/rVmiE1Ia6OIsRk7W20VxUsdlPUjIV
	lDy9g80unisVNSED4uG6HCZQwMzxT8k=
X-Google-Smtp-Source: APXvYqzLAk4urPFZXDGsejMuOtR0JjitWAy/cQgSVVPZLxpMwVfXsy+RMJ8rbqfhGkmfv4pIsEf26A==
X-Received: by 2002:a7b:cc14:: with SMTP id f20mr11483654wmh.58.1579389373347; 
	Sat, 18 Jan 2020 15:16:13 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g18sm15518529wmh.48.2020.01.18.15.16.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 15:16:12 -0800 (PST)
Message-ID: <0f474dc25b7fb6861101254a2c4fd0301f28e167.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Gamblin <Trevor.Gamblin@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 18 Jan 2020 23:16:11 +0000
In-Reply-To: <20200116201933.29628-1-Trevor.Gamblin@windriver.com>
References: <20200116201933.29628-1-Trevor.Gamblin@windriver.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] logrotate.py: improve oeqa test implementation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 18 Jan 2020 23:16:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-01-16 at 15:19 -0500, Trevor Gamblin wrote:
> From: Trevor Gamblin <trevor.gamblin@windriver.com>
> 
> See bug https://bugzilla.yoctoproject.org/show_bug.cgi?id=13632
> 
> Autobuilder tests occasionally fail, reporting that a new logfile
> could not be created. While this failure did occur multiple times, it
> could not be manually reproduced. However, there are issues with the
> implementation of the logrotate.py script that can be fixed. These
> changes will help make the failures clearer, should they continue to
> occur.
> 
> Previously, the test_2_logrotate test would, after running the
> logrotate tool, use "ls -al $HOME/logrotate_dir | wc -l" to count
> the number of files in the rotation directory and determine if the
> rotation was successful. The test to see if there are at least three
> files is problematic, because depending on the version of ls used, it
> may report the target value of 3 even when there are only hidden
> files
> in the directory, potentially reporting a pass for the test when it
> should actually fail. An example with coreutils:
> 
> root@qemux86-64:~# ls -al emptydir/
> total 2
> drwxr-xr-x 2 root root 1024 Jan 14 19:50 .
> drwx------ 3 root root 1024 Jan 14 19:50 ..
> root@qemux86-64:~#
> 
> Where "total" is the number of blocks used. Compare with busybox ls:
> 
> root@qemux86-64:~# ls -al emptydir/
> drwxr-xr-x    2 root     root          1024 Jan 14 19:54 .
> drwx------    3 root     root          1024 Jan 14 19:54 ..
> root@qemux86-64:~#
> 
> Instead of using ls to verify that a certain number of files exists
> in $HOME/logrotate_dir, the tests have been changed to rotate two
> specific logs: the log for wtmp and a new logrotate_testfile created
> during the second test. Both tests check that the logs are correctly
> rotated into $HOME/logrotate_dir by using find and grep on the
> expected filename (e.g. "wtmp" when rotated becomes "wtmp.1", so we
> check to see that wtmp.1 is present in $HOME/logrotate_dir). In
> addition, should the test fail, the directory listing is included in
> the log to aid debugging.
> 
> Finally, note that while the autobuilder failures that this patch
> addresses were only seen during core-image-full-cmdline tests, these
> changes were successfully tested on core-image-minimal and
> core-image-sato with the manual addition of logrotate and openssh-
> sshd
> to the images.
> 
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>

Thanks for this, I haven't looked in detail but test builds came back
with:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1464

Cheers,

Richard


