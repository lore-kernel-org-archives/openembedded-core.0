Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 500656013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 18:11:14 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t2UIBDMP011796; Mon, 30 Mar 2015 13:11:14 -0500
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2015033013111402-590934 ;
	Mon, 30 Mar 2015 13:11:14 -0500 
From: Richard Tollerton <rich.tollerton@ni.com>
To: "Burton\, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LYWAET6K0zr8ALGByjryEe8zV_kmTkkdVjXV-aTwxajFA@mail.gmail.com>
References: <1418864567-9676-1-git-send-email-rich.tollerton@ni.com>
	<CAJTo0LYWAET6K0zr8ALGByjryEe8zV_kmTkkdVjXV-aTwxajFA@mail.gmail.com>
User-Agent: Notmuch/0.19 (http://notmuchmail.org) Emacs/24.4.2
	(x86_64-unknown-linux-gnu)
Date: Mon, 30 Mar 2015 13:11:13 -0500
Message-ID: <87ego6e4ou.fsf@weregild.amer.corp.natinst.com>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 03/30/2015 01:11:14 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 03/30/2015 01:11:14 PM,
	Serialize complete at 03/30/2015 01:11:14 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-03-30_04:, , signatures=0
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
X-List-Received-Date: Mon, 30 Mar 2015 18:11:18 -0000
Content-Type: text/plain

"Burton, Ross" <ross.burton@intel.com> writes:

> On 18 December 2014 at 01:02, Richard Tollerton <rich.tollerton@ni.com>
> wrote:
>
>> `sh -e` causes any errors encountered during shell execution to abort
>> the shell. For terminal sessions like devshell, this causes errors
>> encountered while executing do_terminal to instantaneously kill the
>> session. This is explicitly not what we want for interactive/debugging
>> situations like with terminal, so just remove the '-e' from the sh
>> invocation.
>>
>
> This doesn't happen for me - starting a devshell and running "false"
> doesn't cause the terminal to exit.  I wonder what the difference between
> your environment and mine is.

Running `false` interactively doesn't test this behavior because `sh -e`
explicitly excludes interactive shells from consideration [1] [2].
You'll need to inject a `false` into run.do_terminal in order to
reproduce this.

[1] http://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#set
[2] http://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_08_01

> Ross

