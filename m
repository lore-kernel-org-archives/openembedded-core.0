Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QRseu-0000fv-7a
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 23:08:56 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p51L5hei017847
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 Jun 2011 14:05:43 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 1 Jun 2011 14:05:43 -0700
Message-ID: <4DE6A9A6.4020107@windriver.com>
Date: Wed, 1 Jun 2011 16:05:42 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: Scott Garman <scott.a.garman@intel.com>
References: <cover.1306865217.git.scott.a.garman@intel.com>	<7826575ce92090c4460c7d016e0b06441f84cff7.1306865217.git.scott.a.garman@intel.com>
	<1306921632.2529.18.camel@phil-desktop>
	<4DE67A4F.5010703@intel.com>
In-Reply-To: <4DE67A4F.5010703@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/7] shadow: add a -native recipe with customized utilities
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
X-List-Received-Date: Wed, 01 Jun 2011 21:08:56 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/1/11 12:43 PM, Scott Garman wrote:
> On 06/01/2011 02:47 AM, Phil Blundell wrote:
>> On Tue, 2011-05-31 at 12:53 -0700, Scott Garman wrote:
>>> This adds a -native recipe for the shadow utilities.
>>>
>>> The custom --root option allows the the following utilities to be
>>> run within a chroot when invoked under pseudo:
>>
>> Rather than patching the code for all these utilities, can't you just
>> wrap them in a call to chroot(8)?  That is, make useradd.bbclass do:
>>
>> eval $PSEUDO chroot ${STAGING_DIR_TARGET} useradd ...
>>
>> rather than the existing
>>
>> eval $PSEUDO useradd --root ${STAGING_DIR_TARGET} ...
> 
> That's a reasonable suggestion. I haven't tried it yet, but I have found 
> that pseudo's chroot(2) implementation is not complete. One of the cases 
> where it does not work is when forking child processes, which breaks the 
> jail and the child processes are no longer chroot'ed.
> 
> My guess is that chroot(8) is going to call chroot(2) and then fork a 
> child process to run its additional arguments.

chroot should be complete in pseudo, if you can reproduce any failures we should
pass them upstream.

The reason I suggested the --root option was primarily for the ease of people
who are NOT using the automated scripting, i.e. someone manually adding a
preinst (or similar) to their recipes.

The --root option is easier (to me at least) to understand that having to if-def
stuff around a chroot..  (but that is personal preference...)

--Mark

> cc'ing Mark directly in case he has additional comments or needs to 
> correct me.
> 
> Scott
> 



