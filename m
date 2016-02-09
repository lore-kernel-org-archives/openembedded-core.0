Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2C5976FF69
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 15:41:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u19Ff5AF014152
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Feb 2016 07:41:05 -0800 (PST)
Received: from msp-dhcp15.wrs.com (172.25.34.15) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 9 Feb 2016 07:41:05 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Feb 2016 09:41:02 -0600
Message-ID: <1455032462-124215-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [RFC][PATCH] Resolve an issue when using pipes to process data
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
X-List-Received-Date: Tue, 09 Feb 2016 15:41:06 -0000
Content-Type: text/plain

I'm sending this as an RFC.  I know the patch works, but I think it highlights
a potentially larger issue in the system.

If we're processing data using shell pipes, the return code of a failed
process may end up being lost -- avoiding the regular error capture when
bitbake runs a task.

In this particular case, while working to fix a bug in pseudo we made an
error condition fatal (triggered an abort()), but buildhistory kept on
processing ignoring any issues had occurred.

Breaking up the processing into steps, things that 'could fail', and later
processing steps that shouldn't fail will give us more of an opportunity to
identify failures in the future and deal with them in a quicker manner,
then having to investigate log files for messages.

I'm suspecting we should run a janitor exercise against oe-core looking for
similar situations where we might be piping the data and potentially losing
return codes in the process.

Comments?

Mark Hatle (1):
  buildhistory.bbclass: Break up the find to catch failures

 meta/classes/buildhistory.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.5.0


