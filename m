Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3C43573C71
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 21:32:54 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t2VLWsAP008092; Tue, 31 Mar 2015 16:32:54 -0500
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2015033116325440-646889 ;
	Tue, 31 Mar 2015 16:32:54 -0500 
From: Richard Tollerton <rich.tollerton@ni.com>
To: "Burton\, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LZ6hgVt0gsgNfd_rvtn_gn2syUPugx+f00eVPN2x0-uzw@mail.gmail.com>
References: <1418864567-9676-1-git-send-email-rich.tollerton@ni.com>
	<CAJTo0LYWAET6K0zr8ALGByjryEe8zV_kmTkkdVjXV-aTwxajFA@mail.gmail.com>
	<87ego6e4ou.fsf@weregild.amer.corp.natinst.com>
	<CAJTo0LZ6hgVt0gsgNfd_rvtn_gn2syUPugx+f00eVPN2x0-uzw@mail.gmail.com>
User-Agent: Notmuch/0.19 (http://notmuchmail.org) Emacs/24.4.2
	(x86_64-unknown-linux-gnu)
Date: Tue, 31 Mar 2015 16:32:54 -0500
Message-ID: <874mp0ettl.fsf@weregild.amer.corp.natinst.com>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 03/31/2015 04:32:54 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 03/31/2015 04:32:54 PM,
	Serialize complete at 03/31/2015 04:32:54 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-03-31_06:, , signatures=0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] terminal: Disable shopt errexit
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
X-List-Received-Date: Tue, 31 Mar 2015 21:32:57 -0000
Content-Type: text/plain

"Burton, Ross" <ross.burton@intel.com> writes:

> On 30 March 2015 at 19:11, Richard Tollerton <rich.tollerton@ni.com> wrote:
>
>> Running `false` interactively doesn't test this behavior because `sh -e`
>> explicitly excludes interactive shells from consideration [1] [2].
>> You'll need to inject a `false` into run.do_terminal in order to
>> reproduce this.
>>
>
> I'm clearly not understanding how this behaviour is a problem then.  What
> broke?

What broke is devshell. If there's a bug in run.do_terminal that would
cause a nonzero exit code during non-interactive execution -- e.g.,
http://cgit.openembedded.org/bitbake/commit/?id=18cd0ce6a55c9065c3f1bf223b47d817b5efcd8f
-- then instead of a warning appearing in the devshell, the entire
terminal quits a few milliseconds after it loads.

In other words, this issue escalates other bugs that ought to be
warnings into functionality-killers. This patch de-escalates them
back to warnings.

> Ross

