Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QV3TE-0004co-Ns
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 17:18:01 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5AFEcsV026561
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 10 Jun 2011 08:14:38 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 10 Jun 2011 08:14:38 -0700
Message-ID: <4DF234DD.2060407@windriver.com>
Date: Fri, 10 Jun 2011 10:14:37 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1307639649.git.mark.hatle@windriver.com>
	<f4bf925e5ef24493da42015e1be93d59b85f3a44.1307639649.git.mark.hatle@windriver.com>
	<201106101602.27104.paul.eggleton@linux.intel.com>
In-Reply-To: <201106101602.27104.paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] pseudo: Fix problem related to realpath
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
X-List-Received-Date: Fri, 10 Jun 2011 15:18:01 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/10/11 10:02 AM, Paul Eggleton wrote:
> On Thursday 09 June 2011 18:15:45 Mark Hatle wrote:
>> --- a/meta/recipes-devtools/pseudo/pseudo_1.1.1.bb
>> +++ b/meta/recipes-devtools/pseudo/pseudo_1.1.1.bb
>> @@ -1,9 +1,10 @@
>>  require pseudo.inc
>>  
>> -PR = "r0"
>> +PR = "r1"
> 
> I may be mistaken, but it seems to me that every time we need to rebuild 
> pseudo it results in a race when an older version of pseudo is present. We 
> handle building pseudo on its own first if it's not present, however if it just 
> needs updating we go ahead and rebuild it at the same time as building other 
> packages, and if it just happens that pseudo is needed when it's being built 
> -> bang. At least that's my assumption given that since the last batch of 
> updates, my rebuild of perl-native failed at the same time as pseudo's 
> do_compile with a large number of "ERROR: ld.so: object 'libpseudo.so' from 
> LD_PRELOAD cannot be preloaded: ignored" messages.
> 
> Am I right in that there's currently no mechanism to work around this?
> 
> Cheers,
> Paul
> 

Theoretically updating pseudo shouldn't happen very often.  But yes, currently
there is an issue that pseudo updates are not caused and cause the pseudo
rebuild.  We can work around this by:

* removing the "pseudodone" file in the build directory

* manually running the "first stage" build:
  BBFETCH2=True PSEUDO_BUILD=1 ../bitbake/bin/bitbake pseudo-native

* manually running "bitbake pseudo-native", (still does it as a second stage,
but usually works)

Likely what we need to do is figure out a (quick) way in the bitbake wrapper to
determine if the pseudo has changed... timestamp match to pseudodone?  That of
course still won't be fool proof.

What has been discussed in the past is adding the capabilities for a "staged"
build to bitbake.  Being able to re-invoke the bitbake process after given
stages [automatically] so that in the end bitbake is in charge of the build
steps.  So far though not much has been done with this idea, as we're really not
sure how practical this is.


