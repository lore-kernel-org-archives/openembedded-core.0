Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 43DA260589
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 09:04:50 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id n127so43956202iof.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 02:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=p7HEhuf83sxcIDPzhKLLj1fJXJGZ3BPRbVeQDego644=;
	b=ifNMHgJNbk3rUDl7TnpDicY4x7cg2N/gi/HtvLytBqgrQ8hiIc7ltdm/uJkHSFQlJk
	AEuEHZ6UJcN/7SVDBp6ryqTNxlc9LL4z4TrPyuM65fGA8mbSieKaXmXx40jbikv9kaRG
	QuqeR4QWGBMLQh7Spcl61QT0OymuCH30swivLd7HWwRpLlG0OmSLasulZppBu/gjeb0c
	qvTjDgLO0qERX2uyZwXxo5Xb5lM5VgNAEi3YwgXMX3l7PsS3wiXK1UdOJlwfaS1wRCWQ
	6d7tolCHeBE825nIDknb9bb+R/Sw74rJ11yZQDzQzubCoMgyV3F3dJihMPxvHOocaTa8
	YIgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=p7HEhuf83sxcIDPzhKLLj1fJXJGZ3BPRbVeQDego644=;
	b=OWoY+6Gm1jQ+vPPLPAC6d3aEMlqvyerHSbNaxvg7Avqr/tJfDVnSCK7/RJoLe4DduK
	n4lP0urMdD0B/1cqGHDKLubviRFvBTw4iiXODRPph9HtjS5WfhXE+nHMXjK1cpRJ/Plg
	XLLw6uCUE+gHs/evqZXjDYsUaIzykPy38gqov+9AR35utC9XfM+OMzI3jQKWdfMUGh8t
	c0QceoQXY7FBIOmOCUQen8PffDM2Tsn7hOQ4NzFqoPWLAPvjZqVB/0eAWcU2IdallUaT
	q/W3aLXXy/TzJCqMotYZpaOz6YFfdZrSog+yCg8j5+VtEVc1GfvXZ+eUPJe2h4aG5q6L
	6AaA==
X-Gm-Message-State: ALyK8tKZXJqgfPTd2s+HXM88mE3BXosm0PA4t7aNL6Vk2Sd36K6EBOIXVqSoYrwIqjad+fdS
X-Received: by 10.107.165.12 with SMTP id o12mr6444877ioe.56.1466067891266;
	Thu, 16 Jun 2016 02:04:51 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8D8A2.dip0.t-ipconnect.de. [93.232.216.162])
	by smtp.gmail.com with ESMTPSA id
	b72sm5632047ioj.14.2016.06.16.02.04.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Jun 2016 02:04:50 -0700 (PDT)
Message-ID: <1466067888.19334.33.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Ross Burton <ross.burton@intel.com>
Date: Thu, 16 Jun 2016 11:04:48 +0200
In-Reply-To: <1465917529-18674-1-git-send-email-ross.burton@intel.com>
References: <1465917529-18674-1-git-send-email-ross.burton@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] classes/rm_work: use the idle I/O scheduler class
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
X-List-Received-Date: Thu, 16 Jun 2016 09:04:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-06-14 at 16:18 +0100, Ross Burton wrote:
> As rm_work is just cleanup it shouldn't starve more important tasks such as
> do_compile of I/O, so use BB_TASK_IONICE_LEVEL to run the task in the idle
> scheduler class.

Whether that's desirable depends a lot on the goals for rm_work: when I
tried to use it for TravisCI to get around some pretty tight disk space
constraints, I found that do_rm_work was often not scheduled early
enough because other tasks generating more files had higher priority.

Reducing the IO priority of do_rm_work may have the same effect: it
runs, but then instead of removing files, the system produces more of
them, thus increasing the risk of exhausting the disk space.

I suspect a lot of benchmarking will be needed to determine what really
works well and what doesn't.

I ended up writing a custom scheduler for running under TravisCI:
https://github.com/01org/meta-intel-iot-security/blob/master/scripts/rmwork.py

That orders do_rm_work before any other task and also orders all tasks
related to single recipe so that they run together, thus making it
possible to clean up after do_build sooner. As an additional tweak it
distinguishes between "compile" and "cleanup" tasks and can run
"cleanup" tasks when the normal scheduler wouldn't because
BB_NUMBER_THREADS is reached.

But it has the same problem: not enough benchmarking to really quantify
the effect. All I know is that I stopped running out of disk space under
TravisCI ;-}

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




