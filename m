Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1S0wSk-0002cN-Ji
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 15:49:34 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q1OEfAko005036
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 06:41:10 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 24 Feb 2012 06:41:10 -0800
Message-ID: <4F47A185.9070303@windriver.com>
Date: Fri, 24 Feb 2012 08:41:09 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1330088135.32006.14.camel@ted> <4F479587.2080402@opendreambox.org>
In-Reply-To: <4F479587.2080402@opendreambox.org>
Subject: Re: Using external source trees with OE-Core
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
X-List-Received-Date: Fri, 24 Feb 2012 14:49:35 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2/24/12 7:49 AM, Andreas Oberritter wrote:
> On 24.02.2012 13:55, Richard Purdie wrote:
>> Someone recently asked me about using external source trees with
>> OE-Core. I was aware of srctree.bbclass in OE-Classic and did start
>> looking at it but it has various elements I wasn't so keen on. I
>> therefore wondered if I could improve upon it. I did start from that
>> code base but came up with:
>>
>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/a0&id=ac8a54c18c33aaab6758c34a3d6093d3d3384cee
>> [patch inline below]
>>
>> which I've called externalsrc.bbclass since it behaves a bit
>> differently. In particular, all the usual task targets are available.
>>
>> As an example usage with the above patch applied:
>>
>> cd ~
>> tar -xvzf $DL_DIR/libfm-0.1.17.tar.gz
>> (creates libfm-0.1.17 in my homedir)
>>
>> edit libfm_0.1.17.bb and add:
>>
>> inherit externalsrc
>> S = "/home/richard/libfm-0.1.17"
>
> Do I need to edit libfm_0.1.17.bb in-place, or can it be stored outside
> my layers to be built with bitbake -b, for example?

You should be able to add a bbappend for this item, in a custom development 
layer and not modify the original .bb.  It will still require the two line 
configuration change (and a custom layer configuration... but I recommend that 
anyway.)

> Does S need to contain an absolute path, or could it be set to a path
> relative to the location of the recipe?

I don't know for this development.... but relative can get very messy, 
especially when all of the project, work dir, etc can be overridden to create a 
custom environment for someone.  Enforcing an absolute path isn't a bad idea here.

> It would be nice if it was possible to include bitbake recipes in the
> source trees of my projects, which "just work".

Might be possible in something like base.bbclass to add the inherit if a value 
is set.. then in local.conf you could do something like:

EXTERNALSRC_libfm = "/home/richard/libfm-0.1.17"

And if it's set, the class could do the reset?  That would certainly be easier 
then a layer.

--Mark

> I think this was possible with srctree.bbclass, though I never had it
> working reliably. I think bitbake -cclean always raised errors.
>
> Regards,
> Andreas
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



