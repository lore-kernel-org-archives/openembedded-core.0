Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1QUuVM-0000TT-0G
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 07:43:36 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5A5eD0e028609
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 9 Jun 2011 22:40:13 -0700 (PDT)
Received: from [128.224.162.154] (128.224.162.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 9 Jun 2011 22:40:13 -0700
Message-ID: <4DF1AE42.1070606@windriver.com>
Date: Fri, 10 Jun 2011 13:40:18 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1307529994.git.kai.kang@windriver.com>
	<3753d5b6e3a1c6cec6bdb75b90c73f96058b292c.1307529994.git.kai.kang@windriver.com>
	<4DF183EE.9050605@linux.intel.com>
In-Reply-To: <4DF183EE.9050605@linux.intel.com>
X-Originating-IP: [128.224.162.154]
Cc: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] libxml-simple-perl: update EXTRA_PERLFLAGS
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
X-List-Received-Date: Fri, 10 Jun 2011 05:43:36 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Saul,

> On 06/08/2011 03:49 AM, Kang Kai wrote:
>> From: Kang Kai<kai.kang@windriver.com>
>>
>> [Yocto 1132]
>>
>> libxml-simple-perl should not refer to native perl libs modules, update
>> EXTRA_PERLFLAGS to fix the failure.
>>
>> Signed-off-by: Kang Kai<kai.kang@windriver.com>
>> ---
>>   .../perl/libxml-simple-perl_2.18.bb                |    4 ++--
>>   1 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/perl/libxml-simple-perl_2.18.bb 
>> b/meta/recipes-devtools/perl/libxml-simple-perl_2.18.bb
>> index ca57776..75a018a 100644
>> --- a/meta/recipes-devtools/perl/libxml-simple-perl_2.18.bb
>> +++ b/meta/recipes-devtools/perl/libxml-simple-perl_2.18.bb
>> @@ -2,7 +2,7 @@ SECTION = "libs"
>>   LICENSE = "Artistic"
>>   LIC_FILES_CHKSUM = 
>> "file://README;beginline=70;md5=94aa5d46682b411a53a5494cfb22640e"
>>   DEPENDS += "libxml-parser-perl"
>> -PR = "r1"
>> +PR = "r2"
>>
>>   SRC_URI = 
>> "http://www.cpan.org/modules/by-module/XML/XML-Simple-${PV}.tar.gz"
>>
>> @@ -11,6 +11,6 @@ SRC_URI[sha256sum] = 
>> "a54967c188cda3e20f496c83be4de3f1740eeaa83c0380712ecd969ad8
>>
>>   S = "${WORKDIR}/XML-Simple-${PV}"
>>
>> -EXTRA_PERLFLAGS = "-I 
>> ${STAGING_LIBDIR_NATIVE}/perl/${@get_perl_version(d)}"
>> +EXTRA_PERLFLAGS = "-I ${STAGING_LIBDIR}/perl/${@get_perl_version(d)}"
>>
> Can you explain in more detail why this change is needed?  should the 
> ordering DEPENDS ordering change?

The build failure infos are :

| could not find ParserDetails.ini in 
/mnt/sda10/poky-all-platform/build/tmp/sysroots/x86_64-linux/usr/lib/perl/5.12.3/XML/SAX
| Errno architecture (x86_64-linux-thread-multi-2.6.35-22-generic) does 
not match executable architecture 
(i586-linux-2.6.37-rc5-yocto-standard+) at 
/mnt/sda10/poky-all-platform/build/tmp/sysroots/x86_64-linux/usr/lib/perl/5.12.3/Errno.pm 
line 11.
| Compilation failed in require at 
/mnt/sda10/poky-all-platform/build/tmp/sysroots/x86_64-linux/usr/lib/perl/5.12.3/File/Temp.pm 
line 148.
| BEGIN failed--compilation aborted at 
/mnt/sda10/poky-all-platform/build/tmp/sysroots/x86_64-linux/usr/lib/perl/5.12.3/File/Temp.pm 
line 148.
| Compilation failed in require at 
/mnt/sda10/poky-all-platform/build/tmp/sysroots/x86_64-linux/usr/lib/perl/5.12.3/XML/SAX/PurePerl/Reader/URI.pm 
line 8.
| BEGIN failed--compilation aborted at 
/mnt/sda10/poky-all-platform/build/tmp/sysroots/x86_64-linux/usr/lib/perl/5.12.3/XML/SAX/PurePerl/Reader/URI.pm 
line 8.
| Compilation failed in require at 
/mnt/sda10/poky-all-platform/build/tmp/sysroots/x86_64-linux/usr/lib/perl/5.12.3/XML/SAX/PurePerl/Reader.pm 
line 6.
| BEGIN failed--compilation aborted at 
/mnt/sda10/poky-all-platform/build/tmp/sysroots/x86_64-linux/usr/lib/perl/5.12.3/XML/SAX/PurePerl/Reader.pm 
line 6.
| Compilation failed in require at 
/mnt/sda10/poky-all-platform/build/tmp/sysroots/x86_64-linux/usr/lib/perl/5.12.3/XML/SAX/PurePerl.pm 
line 11.
| BEGIN failed--compilation aborted at 
/mnt/sda10/poky-all-platform/build/tmp/sysroots/x86_64-linux/usr/lib/perl/5.12.3/XML/SAX/PurePerl.pm 
line 11.
| Compilation failed in require at (eval 16) line 1.
| Checking installed modules ...
| ERROR: Function 'do_configure' failed (see 
/mnt/sda10/poky-all-platform/build/tmp/work/i586-poky-linux/libxml-simple-perl-2.18-r1/temp/log.do_configure.21878 
for further information)
| ERROR: Function 'do_configure' failed (see 
/mnt/sda10/poky-all-platform/build/tmp/work/i586-poky-linux/libxml-simple-perl-2.18-r1/temp/log.do_configure.21878 
for further information)


The first error info is caused by no ParserDetails.ini file which should 
be created by libxml-sax-perl-native. When i add the command after 
do_populate_sysroot to create ParserDetails.ini:

perl -MXML::SAX -e "XML::SAX->add_parser(q(XML::SAX::PurePerl))->save_parsers()"


First error could be fixed.
Ref:
http://perl-xml.sourceforge.net/faq/#parserdetails.ini

The other error is caused by require XML::SAX in ${S}/Makefile.PL line 
30, because use "-I 
${STAGING_LIBDIR_NATIVE}/perl/${@get_perl_version(d)}"  as command perl 
options, it uses modules under

/mnt/sda10/poky-all-platform/build/tmp/sysroots/x86_64-linux/usr/lib/perl/5.12.3/

Then meet the 
/mnt/sda10/poky-all-platform/build/tmp/sysroots/x86_64-linux/usr/lib/perl/5.12.3/Errno.pm 
line 11 checks the build arch whether equals the arch using the module. 
Not equal then throw a fatal error.

That's why I use "-I ${STAGING_LIBDIR}/perl/${@get_perl_version(d)}" 
instead.


>
> Sau!
>

Regards,
Kai

>
>>   inherit cpan



