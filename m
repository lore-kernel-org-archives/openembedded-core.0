Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Shi88-0002Kv-EW
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jun 2012 16:13:04 +0200
Received: from mail-qa0-f45.google.com ([209.85.216.45])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 21 Jun 2012 07:01:52 -0700
Received: by qaeb19 with SMTP id b19so4205775qae.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 07:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type
	:x-gm-message-state;
	bh=o9L97VkYzlTiA05HYI7I0N7LNO2jzs920th0bxBLIh8=;
	b=FsIZ0zxTv1UaM5qFCug1blS6EZZdVeLfNZcehrAeqHQVMrVOsf7d6PsC5Fb39SLrh6
	1bkqaQuOwIbMeW1id4/VPUROlirP6yR3tJmmC9K3/mPJ8KrM77aMGO81a6IRnZieGAjw
	RYn2MxmUjeymazQ6/KheBnYbl+amzW78WOU3PfKE/FWW2DrETpcTVUsSlvEePsof8ASM
	74UUpsN1y032c0kegggxOjTGNPvKd8LvgLJPiKbmprWIOzf6mw7u01j5uMJgSY5KdRj9
	/t9hsgcoieoL+ccNFwE7oXxfET5MRZy1asAnp+TpHuLjMZEfo3TT9/NCx18nomLQM7DK
	pgqA==
Received: by 10.224.117.129 with SMTP id r1mr48153827qaq.31.1340287311162;
	Thu, 21 Jun 2012 07:01:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.101.202 with HTTP; Thu, 21 Jun 2012 07:01:30 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Jun 2012 15:01:30 +0100
Message-ID: <CAJTo0LZc57=-7fEto_2dEL=yjDDoKH=HntQQFLTzZo=tqBSxcw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQm9CcUsVaCeUIQCLQ+DbCA/h47JnNqVEp5GIO8aL5SCDQmJXCzH9KQBuFxqKZRTuL2zKPHY
Subject: [RFC] Fetching single files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jun 2012 14:13:04 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I was looking at updating the webkit-gtk package to the latest
upstream when I noticed that instead of just checking out the
repository it checks out a selection of directories and includes in
oe-core the essential top-level files.  I can see the rationale for
this: a full checkout of webkit includes the full test suite and web
site sources.

However I'm not entirely keen on the package shipping the top-level
files in oe-core, as that is asking for trouble.  One solution would
be the ability to fetch a single file through the svn fetcher instead
of a directory, which svn can do using "svn export" (checking out a
file is an error).  This doens't bring any metadata along with it so
it isn't actually a checkout that can be updated in the future, but
for a single file I think this isn't a problem.

In poky-contrib:ross/svn I've started implement a proof of concept on
this.  So far using the singlefile=1 parameter the export logic is
activated, the file is svn exported and stashed in the download
directory, suitable renamed.  The next step is to hook this into the
unpack stage so that the file gets renamed correctly on it's way to
the workdir.

But before I start looking at this I thought I'd mail the list and see
if anyone has any comments.  So, anyone know of any problems, pitfalls
or better solutions?

Ross


