Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id EF7A37C473
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 11:39:33 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id t200so13626244wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 03:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=CBC1SKckWzJrkf3bfK9AhRWxOFMr7H4BTxSEZeUMDpA=;
	b=Pkljw15yDgAmy3CE6K2hH0bF0pv0ssctdfOtcQNM0Uhx55KF/xNanSzFog/rBn1vIQ
	eNZ/Pf1qyKrfT6vn5b8yBfoSnih5vkLaDP1VIA2Hr41iu/Z8biG+CL2ZV+Z6eElEocgZ
	im0PjIEHjhe8QwU+NDYNoYXgQudgQoEBvQVeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=CBC1SKckWzJrkf3bfK9AhRWxOFMr7H4BTxSEZeUMDpA=;
	b=H5Sug6HsFM6p4CqWatEdxynz8P7R+WalY8a6ICFnZCAUl5W89YhWcvv4Tn2BBvLTtP
	KVcgJZ9ld6sy+SL1Ug/6+yTGcjqvSviMqLNSeDSOO3UQOhWbPnSp8bXwpQbvNn9gIAnx
	C/2BldSS1DDAdLeA4NykWM1/U6Q20ChUAm7mfWE/m9pI4YiUPIsB9RssEmxNrA9JLMKb
	PSQMy+2EeNmXjOVvDJEx3dFNT//RrEReCFaM7rJrjUT0rw5relFK4UeAVZem5zIhiMPI
	LeN06ov4jY+Ut4d3uZGzRXKagkYJH2v9e0v+vzlLPCuSA/8TjgV/qpr6mkKp2lIQ6zFr
	FlYA==
X-Gm-Message-State: AJcUukfimq2okFIo2J0cw2b4exKoxNgy039GtrkIVhQl9Xo/U/S0ofUA
	cvBrWRWqtfEi7C04ifYsA/cOvAVtcOo=
X-Google-Smtp-Source: ALg8bN7j25cTw6QDFwC7GAAh5W37zAW/uIZdK0a9OaIfj4ABClCI+jwCqn8sMCvDwYl+pn3AQ+AVsg==
X-Received: by 2002:a7b:c8d7:: with SMTP id f23mr16383358wml.121.1548675574284;
	Mon, 28 Jan 2019 03:39:34 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s8sm127072360wrn.44.2019.01.28.03.39.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 28 Jan 2019 03:39:33 -0800 (PST)
Message-ID: <9c52c249e8b3dcc2e0ef2f14ba04378bedc50a9b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Jan 2019 11:39:32 +0000
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Help needed with ptest
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
X-List-Received-Date: Mon, 28 Jan 2019 11:39:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We now have better data than ever before on the status of the project
from a test results perspective. In particular we can now easily
collect ptest data.

I triggered the tests for qemux86-64 on the autobuilder yesterday, the
results are published and you can see them with:

wget https://autobuilder.yocto.io/pub/non-release/20190127-9/testresults/qemux86-64-ptest/testresults.json 

To show the raw logs you can quickly hack to make then more readable:

cat testresults.json  | sed 's/\\n/\n/g'  > testresults1.json 

and there are numerous worrying things when you read them such as if
you grep for "TIMEOUT:".

I also have a suspicion that some ptest runners are exiting without
cleaning up all processes resulting in corrupted output later in the
logs too, I saw something like that locally, I think for perl. More
investigation is needed for that.

There are multiple areas that could do with help:

a) investigate/fix the timeouts
b) improve the test results tool Ee Peng has posted to include ptest
processing tools:
 i) view the logs
 ii) compare the results
 iii) highlight timeouts 
 iv) summarise durations
c) Split logs into individual ptest runs instead of one block
d) record the timings for the individual ptest blocks
e) Add timeout status for tests into the json so we can explicitly test
for it.

I'd welcome help from anyone in any of the above areas, we probably
need to create feature enhancement bugs for them.

Cheers,

Richard



