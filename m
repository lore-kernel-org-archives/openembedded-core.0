Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UaGfP-0003MV-0L
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 04:33:18 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r492F3CR025793
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 8 May 2013 19:15:03 -0700 (PDT)
Received: from [128.224.162.224] (128.224.162.224) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 8 May 2013 19:15:03 -0700
Message-ID: <518B06A2.6000708@windriver.com>
Date: Thu, 9 May 2013 10:14:58 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: Mike Looijmans <mike.looijmans@topic.nl>
References: <cover.1368002042.git.liezhi.yang@windriver.com>
	<ee7a94478d58f0f43640cf9ae97018545a4ce6b6.1368002042.git.liezhi.yang@windriver.com>
	<518A3EF8.20807@topic.nl>
In-Reply-To: <518A3EF8.20807@topic.nl>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] bbclass: bb.fatal() clean up
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 May 2013 02:33:24 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/08/2013 08:03 PM, Mike Looijmans wrote:
> On 05/08/2013 11:06 AM, Robert Yang wrote:
>> The bb.fatal() is defined as:
>>
>> def fatal(*args):
>>      logger.critical(''.join(args))
>>      sys.exit(1)
>>
>> So anything after bb.fatal() in the same code block doesn't have any
>> effect, e.g.:
>>
>>      bb.fatal("%s_%s: %s" % (var, pkg, e))
>>      raise e
>>
>> The "raise e" should be removed.
>
> Just some random thoughts that occurred to me when I read this:
>

Hi Mike, thanks for your comments, but the "raise sys.exit(1)" doesn't raise
anything, e.g.:

import sys

def fatal():
         sys.exit(1)

try:
         raise fatal()
except Exception as e:
         raise e

I think that the "raise fatal()" equals to "fatal()" here.

// Robert

> The "terminate" effect would be obvious if "fatal" were an exception to be
> raised instead of a function to call which does not really return. If I'm not
> mistaken, "sys.exit(1)" actually just raises a SystemExit exception.
>
> So instead of:
>
> bb.fatal("something went wrong")
>
> the syntax would become:
>
> raise bb.Fatal("something went wrong")
>
>
> Having typed this, the next random thought I got was that a thing like
>
> catch Exception, e:
>     bb.fatal("Error: ", e)
>
> isn't really adding anything useful, it just "translates" the exception, logs
> its message, and then throws an obscure system exit exception instead of the
> much more useful inner exception.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


