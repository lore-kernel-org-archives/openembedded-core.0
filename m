Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SktgF-0003pD-0V
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 11:09:27 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5U8wShM019072
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jun 2012 01:58:28 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Sat, 30 Jun 2012 01:58:28 -0700
Message-ID: <4FEEBFB2.8080804@windriver.com>
Date: Sat, 30 Jun 2012 16:58:26 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <4FED7714.5000309@windriver.com> <1340969529.23146.143.camel@ted>
In-Reply-To: <1340969529.23146.143.camel@ted>
Subject: Re: The native perl's path is not in PATH
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
X-List-Received-Date: Sat, 30 Jun 2012 09:09:27 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/29/2012 07:32 PM, Richard Purdie wrote:
> On Fri, 2012-06-29 at 17:36 +0800, Robert Yang wrote:
>> The native perl is installed to:
>>
>> ${STAGING_BINDIR_NATIVE}/perl-native/perl
>>
>> But this isn't in the PATH, so we can use the native perl
>> by the command "perl" or "#!/usr/bin/env perl".
>>
>> I wonder why we install the perl to ${STAGING_BINDIR_NATIVE}/perl-native,
>> but not to ${STAGING_BINDIR_NATIVE}.
>>
>> It would be good if we can add ${STAGING_BINDIR_NATIVE}/perl-native to the path
>> or install the native perl to ${STAGING_BINDIR_NATIVE}, I will send a patch
>> for it if you are ok with it.
>
> No, this is very deliberately not in PATH by default. Please see the
> mailing list archives and the original patches that implemented this to
> understand why.
>
> Such a patch will not be accepted.
>
> What problem are you trying to fix?
>

Thanks, the problem is that when "#!/very/long/path/to/perl" in a perl
script, there would be an error "Bad interpreter: No such file or directory",
when the length of "#!/very/long/path/" is longer than 170 (or smaller), the
script which has this problem is the dpkg-scanpackages (and other dpkg-*
scripts, but they don't run when generate the rootfs of deb backend)) we can
use "#!/usr/bin/env perl" to fix this problem if the native perl is in the
PATH, and we can't use the host's perl since the host perl's @INC doesn't
contain the native perl's module which is needed by dpkg-scanpackages.

I think that I can use "/path/to/native-perl/perl dpkg-scanpackages"
to fix this problem since we can't add the native perl to the PATH.

// Robert

> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


