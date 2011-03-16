Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1PztZr-0006bU-EV
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Mar 2011 17:28:04 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p2GGPoSe029843
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Mar 2011 09:25:50 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 16 Mar 2011 09:25:50 -0700
Message-ID: <4D80E48C.4010902@windriver.com>
Date: Wed, 16 Mar 2011 11:25:48 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1300291424.git.mark.hatle@windriver.com>	
	<2e2980aae580fa0a143e9450596b64c390bbc236.1300291424.git.mark.hatle@windriver.com>
	<1300292546.30423.1891.camel@rex>
In-Reply-To: <1300292546.30423.1891.camel@rex>
X-Originating-IP: [172.25.36.231]
Cc: poky@lists.pokylinux.org, openembedded-core@lists.openembedded.org
Subject: Re: [poky] [PATCH 1/6] package.bbclass: Fix missing debug src files
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
X-List-Received-Date: Wed, 16 Mar 2011 16:28:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 3/16/11 11:22 AM, Richard Purdie wrote:
> On Wed, 2011-03-16 at 11:15 -0500, Mark Hatle wrote:
>> The previous change used egrep instead of fgrep.  We need to use fgrep because
>> there are expression like syntaxes in some file names, we need exact matches.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>>  meta/classes/package.bbclass |    3 ++-
>>  1 files changed, 2 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
>> index a7a5894..ac30cbe 100644
>> --- a/meta/classes/package.bbclass
>> +++ b/meta/classes/package.bbclass
>> @@ -233,9 +233,10 @@ def splitfile2(debugsrcdir, d):
>>         processdebugsrc =  "LC_ALL=C ; sort -z -u '%s' | egrep -v -z '(<internal>|<built-in>)$' | "
>>         # We need to ignore files that are not actually ours
>>         # we do this by only paying attention to items from this package
>> -       processdebugsrc += "egrep -z '%s' | "
>> +       processdebugsrc += "fgrep -z '%s' | "
>>         processdebugsrc += "(cd '%s' ; cpio -pd0mL '%s%s' 2>/dev/null)"
>>  
>> +       bb.note(processdebugsrc % (sourcefile, workbasedir, workparentdir, dvar, debugsrcdir))
>>         os.system(processdebugsrc % (sourcefile, workbasedir, workparentdir, dvar, debugsrcdir))
>>  
>>         # The copy by cpio may have resulted in some empty directories!  Remove these
> 
> Did you mean to leave the bb.note() in?

No, that was supposed to be removed.  Should I yank it and re-push the commit?

--Mark

> Cheers,
> 
> Richard
> 



