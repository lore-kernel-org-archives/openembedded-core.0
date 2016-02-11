Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0A94A7318C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 16:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1BGthv0010346; Thu, 11 Feb 2016 16:57:34 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 226ktaRQFvdn; Thu, 11 Feb 2016 16:57:34 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1BGvU3v010400
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 11 Feb 2016 16:57:31 GMT
Message-ID: <1455209850.16142.261.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 11 Feb 2016 16:57:30 +0000
In-Reply-To: <1455032462-124215-1-git-send-email-mark.hatle@windriver.com>
References: <1455032462-124215-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [RFC][PATCH] Resolve an issue when using pipes to process data
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
X-List-Received-Date: Thu, 11 Feb 2016 16:57:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-02-09 at 09:41 -0600, Mark Hatle wrote:
> I'm sending this as an RFC.  I know the patch works, but I think it
> highlights
> a potentially larger issue in the system.
> 
> If we're processing data using shell pipes, the return code of a
> failed
> process may end up being lost -- avoiding the regular error capture
> when
> bitbake runs a task.
> 
> In this particular case, while working to fix a bug in pseudo we made
> an
> error condition fatal (triggered an abort()), but buildhistory kept
> on
> processing ignoring any issues had occurred.
> 
> Breaking up the processing into steps, things that 'could fail', and
> later
> processing steps that shouldn't fail will give us more of an
> opportunity to
> identify failures in the future and deal with them in a quicker
> manner,
> then having to investigate log files for messages.
> 
> I'm suspecting we should run a janitor exercise against oe-core
> looking for
> similar situations where we might be piping the data and potentially
> losing
> return codes in the process.

We do also have a problem with this specific patch since it causes
setscene failures for certain "restore from sstate" secnarios where
pseudo-native might not be available yet it could try and execute it.

Currently it silently fails, which is obviously bad, but breaking the
builds completely is worse.

I've not looked into the details yet but I can't take the patch as is.

Cheers,

Richard



