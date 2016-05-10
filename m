Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 0A69E731C6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 00:24:14 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 09 May 2016 17:24:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,602,1455004800"; d="scan'208";a="699451559"
Received: from smogharr-mobl.amr.corp.intel.com ([10.254.181.95])
	by FMSMGA003.fm.intel.com with ESMTP; 09 May 2016 17:24:14 -0700
Date: Mon, 9 May 2016 17:24:13 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20160510002413.GA31614@smogharr-mobl.amr.corp.intel.com>
References: <1462837346-27095-1-git-send-email-stephano.cetola@linux.intel.com>
	<1462837346-27095-2-git-send-email-stephano.cetola@linux.intel.com>
	<92C96566-57F7-4787-9158-9137CA80C077@gmail.com>
MIME-Version: 1.0
In-Reply-To: <92C96566-57F7-4787-9158-9137CA80C077@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/2] systemd: add sysusers config option to defaults
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
X-List-Received-Date: Tue, 10 May 2016 00:24:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 05/09, Khem Raj wrote:
> 
> > On May 9, 2016, at 4:42 PM, Stephano Cetola <stephano.cetola@linux.intel.com> wrote:
> > 
> > Without the sysusers config option, the build will not know which users
> > need to be added for systemd. This is especially necessary if the
> > filesystem is readonly, as these users cannot be added at runtime.
> > 
> > Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
> > ---
> > meta/recipes-core/systemd/systemd_229.bb | 4 +++-
> > 1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-core/systemd/systemd_229.bb b/meta/recipes-core/systemd/systemd_229.bb
> > index c23c749..aba73df 100644
> > --- a/meta/recipes-core/systemd/systemd_229.bb
> > +++ b/meta/recipes-core/systemd/systemd_229.bb
> > @@ -23,6 +23,7 @@ DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl rea
> > SECTION = "base/shell"
> > 
> > inherit useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest gettext bash-completion
> > +USERADDEXTENSION += " useradd-staticids"
> > 
> > SRCREV = "714c62b46379abb7558c544665522aca91691e10"
> > 
> > @@ -80,7 +81,8 @@ PACKAGECONFIG ??= "xz \
> >                    quotacheck \
> >                    bootchart \
> >                    hostnamed \
> > -                   ${@bb.utils.contains('TCLIBC', 'glibc', 'myhostname sysusers', '', d)} \
> > +                   sysusers \
> > +                   ${@bb.utils.contains('TCLIBC', 'glibc', 'myhostname', '', d)} \
> 
> sysusers did not compile with uclibc, did you test this patch with uclibc?
You are correct, it still fails. Sorry, you can drop this from the
series.
> 
> >                    hibernate \
> >                    timedated \
> >                    timesyncd \
> > --
> > 2.8.0
> > 
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 



