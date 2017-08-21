Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 449A6782A7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 21:23:17 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7LLNHL2005550
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 21 Aug 2017 22:23:18 +0100
Message-ID: <1503350597.32591.77.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 21 Aug 2017 22:23:17 +0100
In-Reply-To: <CA+chaQdU05LZtB_LB8y0aMi=Oqe6uyGO=3SY_X4q2xCYtJNZNQ@mail.gmail.com>
References: <20170821065633.27570-1-Martin.Jansa@gmail.com>
	<20170821205624.19892-1-Martin.Jansa@gmail.com>
	<1503349649.32591.71.camel@linuxfoundation.org>
	<CA+chaQdU05LZtB_LB8y0aMi=Oqe6uyGO=3SY_X4q2xCYtJNZNQ@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Mon, 21 Aug 2017 22:23:18 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] insane.bbclass: write QA issues to log file only when they are in ERROR_QA or WARN_QA
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
X-List-Received-Date: Mon, 21 Aug 2017 21:23:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-08-21 at 23:13 +0200, Martin Jansa wrote:
> > all messages are put into the log but at differing log levels.
> 
> But there aren't the "log levels" in the file (as NOTE, WARN, ERROR)
> now, it writes only P, error message and type of QA check (not the
> selected severity of it, like bb.error, bb.warn, bb.note used in the
> function for normal output).
> 
> See the function above package_qa_handle_error:
> 
> def package_qa_write_error(type, error, d):
>     logfile = d.getVar('QA_LOGFILE')
>     if logfile:
>         p = d.getVar('P')
>         with open(logfile, "a+") as f:
>             f.write("%s: %s [%s]\n" % (p, error, type))
> 

Sorry, I misread your earlier message and assumed it was logging the
level already. I've spent too long staring at bitbake server bugs :/.

I'm still torn on this, I can see why qa.log makes sense to contain all
the qa issues found and then the WARN/ERROR levels filter the console
output (and ultimately the bitbake exit code). I can also see why in
general we'd not want "levels" in the logfile, its more of a console
issue.

You could do "grep -v version-going-backwards qa.log" I guess?

Cheers,

Richard



