Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QcJcC-0001FU-BM
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 17:57:17 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 30 Jun 2011 08:53:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,450,1304319600"; d="scan'208";a="22399873"
Received: from swold-mobl.jf.intel.com (HELO [10.24.82.35]) ([10.24.82.35])
	by fmsmga002.fm.intel.com with ESMTP; 30 Jun 2011 08:53:31 -0700
Message-ID: <4E0C9BFB.3070906@linux.intel.com>
Date: Thu, 30 Jun 2011 08:53:31 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Phil Blundell <pb@pbcl.net>
References: <1309275023-2626-1-git-send-email-koen@dominion.thruhere.net>	<1309277475.20015.320.camel@rex>	<AE12D97B-A9AF-4516-93D2-7A5655B46844@dominion.thruhere.net>	<1309354589.2551.40.camel@phil-desktop>	<1309355375.20015.383.camel@rex>	<1309432642.2551.131.camel@phil-desktop>
	<1309445640.20015.444.camel@rex>
In-Reply-To: <1309445640.20015.444.camel@rex>
Subject: Re: [PATCH] eglibc-locale: fix localedef packaging
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
X-List-Received-Date: Thu, 30 Jun 2011 15:57:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/30/2011 07:54 AM, Richard Purdie wrote:
> On Thu, 2011-06-30 at 12:17 +0100, Phil Blundell wrote:
>> On Wed, 2011-06-29 at 14:49 +0100, Richard Purdie wrote:
>>> I'd love to see a patch for this! :)
>>
>> Your wish, naturally, is my command.  I've built micro-base-image with
>> this and verified that I didn't get any false positives; I also checked
>> (via some manual fiddling) that it did indeed detect the case that we
>> want it to.
>>
>> I guess it might be a good idea for someone to test it with a slightly
>> larger dataset before actually checking it in, just in case.
>
> Thanks, I'll let Saul try this against a wider build and assuming it
> doesn't throw out too many issues we can get it merged.
>
Phil,

Can I get this as a proper patch email with a clean header, I will start 
testing with below.

Thanks
	Sau!


> Cheers,
>
> Richard
>
>> p.
>>
>> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
>> index 35809b9..f7e5524 100644
>> --- a/meta/classes/insane.bbclass
>> +++ b/meta/classes/insane.bbclass
>> @@ -103,6 +103,7 @@ def package_qa_get_machine_dict():
>>   # 8 - .la contains reference to the workdir
>>   # 9 - LDFLAGS ignored
>>   # 10 - Build paths in binaries
>> +# 11 - package depends on devel package
>>
>>   def package_qa_clean_path(path,d):
>>       """ Remove the common prefix from the path. In this case it is the TMPDIR"""
>> @@ -134,6 +135,7 @@ def package_qa_write_error(error_class, name, path, d):
>>           ".la contains reference to the workdir",
>>           "LDFLAGS ignored",
>>           "package contains reference to tmpdir paths",
>> +	"package depends on devel package",
>>       ]
>>
>>       log_path = os.path.join( bb.data.getVar('T', d, True), "log.qa_package" )
>> @@ -493,12 +495,14 @@ def package_qa_check_rdepends(pkg, pkgdest, d):
>>           # Now check the RDEPENDS
>>           rdepends = bb.utils.explode_deps(bb.data.getVar('RDEPENDS', localdata, True) or "")
>>
>> -
>>           # Now do the sanity check!!!
>>           for rdepend in rdepends:
>>               if "-dbg" in rdepend:
>>                   error_msg = "%s rdepends on %s" % (pkgname,rdepend)
>>                   sane = package_qa_handle_error(2, error_msg, pkgname, rdepend, d)
>> +	    if (not "-dev" in pkg and not "-staticdev" in pkg) and rdepend.endswith("-dev"):
>> +	        error_msg = "%s rdepends on %s" % (pkgname, rdepend)
>> +                sane = package_qa_handle_error(11, error_msg, pkgname, rdepend, d)
>>
>>       return sane
>>
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


