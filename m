Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QaKer-0007ZH-SH
	for openembedded-core@lists.openembedded.org;
	Sat, 25 Jun 2011 06:39:50 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5P4aAEd011695
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2011 21:36:11 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 24 Jun 2011 21:36:10 -0700
Message-ID: <4E0565B9.301@windriver.com>
Date: Fri, 24 Jun 2011 23:36:09 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1308944503.git.mark.hatle@windriver.com>	<4f64811b18665d26645a376fda0828dad0b07c7c.1308944503.git.mark.hatle@windriver.com>
	<20110624205136.GB7676@sakrah.homelinux.org>
In-Reply-To: <20110624205136.GB7676@sakrah.homelinux.org>
Subject: Re: [PATCH 1/1] prelink: Uprev prelink to latest version (V2)
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
X-List-Received-Date: Sat, 25 Jun 2011 04:39:50 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/24/11 3:51 PM, Khem Raj wrote:
> On (24/06/11 14:42), Mark Hatle wrote:
>> The latest cross-prelink version tracks the prelink r190 SVN.
>>
>> Fix two minor issues as well.  If we remove the package, we would
>> unprelink the filesystem after the rm was finished.  This is
>> incorrect.. we need to do this prerm.
>>
>> Move the cron and cron configuration file to a new package split.
>> This item is not valid for most embedded users.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>>  .../prelink/prelink/prelink.default                |    2 +-
>>  meta/recipes-devtools/prelink/prelink_git.bb       |   25 +++++++++++++++++--
>>  2 files changed, 23 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/prelink/prelink/prelink.default b/meta/recipes-devtools/prelink/prelink/prelink.default
>> index 901258e..d8802f8 100644
>> --- a/meta/recipes-devtools/prelink/prelink/prelink.default
>> +++ b/meta/recipes-devtools/prelink/prelink/prelink.default
>> @@ -2,7 +2,7 @@
>>  # or to yes to enable it.
>>  # (if you change this from yes to no prelink -ua
>>  # will be run next night to undo prelinking)
>> -PRELINKING=unknown
>> +PRELINKING=yes
>>  
> 
> this is a functionality change. Will it have system wide effects ?

If the user previously had the prelinker installed onto the target, and had the
cron system installed to run the daily scripts, and never bothered to configure
prelink before..  whenever the script ran it would undo any prelinking that had
occurred.

After the change, it's now optional to install the cron scripts.  If they are
installed, they default to -on- which means that if cron runs the script it will
attempt to update the prelinking on the system.

This does not affect the build-time prelinking in any way.  For many systems
there is no reason to have the prelinker on the target, it's only needed for
field upgrades.

So, I consider this an enhancement (splitting the script out to make it
optional), and a bug-fix -- enabling re-prelink functionality if the script is
installed -- vs the previous "un-prelink" being the default.

--Mark

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



