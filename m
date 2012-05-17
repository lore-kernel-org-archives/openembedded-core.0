Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1SV7mP-0005jO-Gi
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 22:58:37 +0200
Received: from mail-lb0-f180.google.com ([209.85.217.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 17 May 2012 13:48:32 -0700
Received: by lbbgh12 with SMTP id gh12so1476077lbb.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 13:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:x-gm-message-state;
	bh=SLkcJSVartxfxzqdZJQ+/N/n/42foJnqL23VZ0VS3QA=;
	b=h+AMJBMrH6OE/EDj58kt2ZRXcWy5JmpRrXz5mtPAU/7uTY1lDflrSHc/vfbuxhxzI8
	60+qrj71Dyldn8E4W41pZlV9H6Wzr94B9jixQ7wzpiqYbk6ZmBUVViCU/TEngRkw9pK0
	miEDQQQHBDlJEzzVahL77Y+D5UAiFHTDCPLpF4mSzZNV44uxzpEqN0CAlLPSSsZSSUDl
	AcB3o3rEHpDwKAvgbCvxUQbq+pN9ifiELwxV+rnHo5NyIP210wUtyi9e+GtVDh5oVVic
	E2vCEmzi8nTIx7GWSBxt9QK7Z0t1iLPTYkyxIiv2SQbm/XJ/iekLWB7aND6U2ATX8vXA
	0agQ==
MIME-Version: 1.0
Received: by 10.152.145.169 with SMTP id sv9mr8455292lab.12.1337287710371;
	Thu, 17 May 2012 13:48:30 -0700 (PDT)
Received: by 10.112.107.137 with HTTP; Thu, 17 May 2012 13:48:30 -0700 (PDT)
In-Reply-To: <CAK18fxH5H5En0H+k7VccgGUCPApwcL7Xs+RV=1=pvRu_wRYXVQ@mail.gmail.com>
References: <CAK18fxECi+PxHhW8pAm2URRE1ZF=h2_gEPXMvvioTQnhKGWYHw@mail.gmail.com>
	<CADkTA4MXvMJt=JhDKdjDR9o3nkYVWmfnEmRnC1cheju6Tbh0Sw@mail.gmail.com>
	<4FB50005.7000807@gherzan.ro>
	<CAPhnLPDzZfuRBKxR3Ru+2nvozRy4evhmtFUf2d-NmqNwY4RjZw@mail.gmail.com>
	<CAK18fxH5H5En0H+k7VccgGUCPApwcL7Xs+RV=1=pvRu_wRYXVQ@mail.gmail.com>
Date: Thu, 17 May 2012 13:48:30 -0700
Message-ID: <CAPhnLPBSsP3acUN1uZvPDVCq6PzXF8mGGsFyvgdbfz6EuZ_RSA@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkElruzczfcV6QmGTF9GnLqv35EJgDop/XEgAg3ckrd1S1qawMgbE9bqhLFfu2dbOp6wjQi
Subject: Re: Linux-yocto 3.0 crashes at do_patch...
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
X-List-Received-Date: Thu, 17 May 2012 20:58:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, May 17, 2012 at 7:59 AM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> Today i just gave another try.... same result.

Responding here as well as the yocto list:

A few people have been having this issue and after some discussion we
think we have a root cause. Let me first explain what happened.

The autobuilder infrastructure shares a common DL_DIR in order to
optimize the builds and provide the source mirror. This DL_DIR is
rsynced to the publicaly available source mirror on a regular basis.
During our infrastructure upgrade the autobuilder attempted to pull
the tar archive for linux-yocto-3.0
(http://downloads.yoctoproject.org/mirror/sources/git2_git.yoctoproject.org.linux-yocto-3.0.tar.gz)
but due to network issues related to our recent infrastructure upgrade
the file ended up as a 0 byte file. This file was rsynced the the
source mirror. A few days ago this was mentioned as an issue. Michael
Halstead corrected the network issue and I manually removed the file.
The autobuilder repulled the archive correctly and repopulated the
source mirror with it.

Things should have been ok at this point. However, we were still
getting reports of people sporadically running into a 0 byte file. Not
all the time, but some of the time. Michael Halstead and I just tailed
out the apache logs with Tom Zanussi wgetting the problematic file,
watching for failures. No failures were seen in the error logs however
Tom was still getting sporadic 0 byte files. Which means that his
request wasn't even hitting the server. I was not able to replicate
this. The only difference we could see is that I generally do not go
through a proxy whereas Tom was.

Our theory at this point is that all of the people who are hitting
this issue are going through a proxy and that their proxy setup has
cached that 0 byte file and refuses to regenerate it. There isn't a
lot we can do from our end about that other than suggest the following
work around. If you run into odd fetch issues with *just* the
linux-yocto-3.0 tar archive, clear out your DL_DIR of
git2_git.yoctoproject.org.linux-yocto-3.0.tar.gz and set the
following:

PREMIRRORS ?= "\
bzr://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n \
cvs://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n \
git://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n \
hg://.*/.*    http://autobuilder.yoctoproject.org/sources/ \n \
osc://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n \
p4://.*/.*    http://autobuilder.yoctoproject.org/sources/ \n \
svk://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n \
svn://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n"

MIRRORS =+ "\
ftp://.*/.*      http://autobuilder.yoctoproject.org/sources/ \n \
http://.*/.*     http://autobuilder.yoctoproject.org/sources/ \n \
https://.*/.*    http://autobuilder.yoctoproject.org/sources/ \n"

This will force the fetch to go to the autobuilder host of sources and
should work around any proxy caching issues. Then call your local IT
folks and ask them to clear out your proxy cache. If you run into any
fetch issues not related to this file, please let me know.

-b


