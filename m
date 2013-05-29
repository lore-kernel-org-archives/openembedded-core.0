Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E290A60959
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 20:44:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4TKj1Y4022005
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 29 May 2013 13:45:01 -0700 (PDT)
Received: from msp-dhcp16.wrs.com (172.25.34.16) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 29 May 2013 13:44:59 -0700
Message-ID: <51A668CA.1070205@windriver.com>
Date: Wed, 29 May 2013 15:44:58 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <1369840203-21898-1-git-send-email-mark.hatle@windriver.com>
	<1369840203-21898-3-git-send-email-mark.hatle@windriver.com>
	<20130529155906.GO3192@jama> <51A62D21.4010909@windriver.com>
	<1369857580.6644.13.camel@pb-ThinkPad-R50e>
In-Reply-To: <1369857580.6644.13.camel@pb-ThinkPad-R50e>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/21] Add directory information to the pkgdata files
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
X-List-Received-Date: Wed, 29 May 2013 20:44:59 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/29/13 2:59 PM, Phil Blundell wrote:
> On Wed, 2013-05-29 at 11:30 -0500, Mark Hatle wrote:
>> It's up to the tooling that are using these files to check if the directory
>> exists, if it does not -- then using bitbake -c patch <recipe> will create it.
>> (even in the sstate-cache case.)
>
> I'm not sure whether checking that the directory exists is all that
> safe; in the shared-sstate scenario I think it's conceivable that the
> directory might exist but contain something else, or be unreadable due
> to permissions, or disappear underneath you while you're using it.
>
> And, of course, "bitbake -c patch ..." won't necessarily create the same
> ${S} that you got from pkgdata in that case, it will create it in your
> local TMPDIR.

On 5/29/13 12:36 PM, Khem Raj wrote:
 > Hi Mark
 >
 > This won't work well when package is populated from sstate is there a way for it
 > to work seamlessly across sstate it might be useful

I was looking at this again.  I thought the pkgdata was reconstructed each time 
in the current TMPDIR.  I didn't realize it was just restored from the 
sstate-cache.  (We've got other patches in layers that trigger pkgdata-like 
files to be generated as well.. and I must have gotten the two confused.)

So yes, I understand now that this won't work properly as the embedded path is 
outside of the TMPDIR.  The intention was that the path would change to match 
the current build directories TMPDIR.  And due to the magic of the sstate-cache 
checksumming, running the do_patch should result in the same sources...


So -if- others thought this was useful, I'll fix the patch to change the S/B on 
the sstate setup to the proper TMPDIR locations.  But so far I'm not hearing 
anyone who wants this -- so I'll just keep it local.

> Also, the subject line for this patch (and several others from the batch
> you just sent) is not in the right format.  Please see the guidelines on
> the wiki.

I missed that, I'll correct the commits summary lines and resubmit them.

Drop 2/21
Fixup 9, 15, & 18

Did I miss any?

--Mark

> p.
>
>


