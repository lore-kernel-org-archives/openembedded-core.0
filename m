Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 447BB701A9;
	Fri, 25 Jul 2014 05:11:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6P5B04E004219
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 24 Jul 2014 22:11:00 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Thu, 24 Jul 2014 22:11:00 -0700
Message-ID: <53D1E6E3.5000202@windriver.com>
Date: Fri, 25 Jul 2014 13:10:59 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1406012813-21233-1-git-send-email-rongqing.li@windriver.com>
	<20140724111438.GI2492@jama>
In-Reply-To: <20140724111438.GI2492@jama>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [PATCH v2][meta-perl] libxml-sax-writer-perl: add recipe
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
X-List-Received-Date: Fri, 25 Jul 2014 05:11:06 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/24/2014 07:14 PM, Martin Jansa wrote:
> On Tue, Jul 22, 2014 at 03:06:53PM +0800, rongqing.li@windriver.com wrote:
>> From: Roy Li <rongqing.li@windriver.com>
>
> Sorry, but it still isn't correct even with allarch, because there is
> dependency on TUNE_PKGARCH perl:
>
> ERROR: libxml-filter-buffertext-perl different signature for task do_configure.sigdata between qemux86copy and qemuarm
> Hash for dependent task perl_5.20.0.bb.do_populate_sysroot changed from a5827c8deafb0ace555794c62c44e19f to 1a07f7ac7ad2a2750b58dfa60136114b
>
> ERROR: libxml-sax-writer-perl different signature for task do_configure.sigdata between qemux86copy and qemuarm
> Hash for dependent task perl_5.20.0.bb.do_populate_sysroot changed from a5827c8deafb0ace555794c62c44e19f to 1a07f7ac7ad2a2750b58dfa60136114b
>

1. I can not reproduce it, where are my steps be wrong?

$ ../scripts/sstate-diff-machines.sh --tmpdir=tmp/ --machines="qemuarm 
qemux86copy qemux86-64" --targets=libxml-sax
-writer-perl
...
NOTE: Preparing runqueue
NOTE: Reparsing files to collect dependency data
NOTE: Tasks Summary: Attempted 0 tasks of which 0 didn't need to be 
rerun and all succeeded.
INFO: Output written in: 
/buildarea1/lirq/new/5/poky/build-next/tmp/sstate-diff/1406264562

$cd /buildarea1/lirq/new/5/poky/build-next/tmp/sstate-diff/1406264562
$

builder@pek-yocto-build1:/buildarea1/lirq/new/5/poky/build-next/tmp/sstate-diff/1406264562$ 
find . |grep writer-perl|grep sysroot
./qemux86copy/all-poky-linux/libxml-sax-writer-perl/0.54-r0.do_populate_sysroot.sigdata.323a1635a2b08060e64815de8e009281
./qemuarm/all-poky-linux/libxml-sax-writer-perl/0.54-r0.do_populate_sysroot.sigdata.323a1635a2b08060e64815de8e009281
./qemux86-64/all-poky-linux/libxml-sax-writer-perl/0.54-r0.do_populate_sysroot.sigdata.323a1635a2b08060e64815de8e009281
builder@pek-yocto-build1:/buildarea1/lirq/new/5/poky/build-next/tmp/sstate-diff/1406264562$ 




2. the cause maybe the below:
perl module will depend on perl, but perl is not allarch, so make your 
error.

meta/classes/cpan-base.bbclass
   7 DEPENDS  += "${@["perl", 
"perl-native"][(bb.data.inherits_class('native', d))]}"
   8 RDEPENDS_${PN} += "${@["perl", 
""][(bb.data.inherits_class('native', d))]}"




3. no perl modules inherit allarch in oe-core;
oe-core$ find ./ -name "*perl*bb" -exec grep allarch {} \;
oe-core$


but I think some module should be allarch, like: libxml-simple-perl
https://packages.debian.org/search?keywords=libxml-simple-perl&searchon=names&suite=stable&section=all



-Roy

>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
>> ---
>>   .../libxml/libxml-sax-writer-perl_0.54.bb          |   25 ++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>   create mode 100644 meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.54.bb
>>
>> diff --git a/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.54.bb b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.54.bb
>> new file mode 100644
>> index 0000000..52458e4
>> --- /dev/null
>> +++ b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.54.bb
>> @@ -0,0 +1,25 @@
>> +SUMMARY = "XML::SAX::Writer - SAX2 Writer"
>> +DESCRIPTION = "\
>> +XML::SAX::Writer helps to serialize SAX2 representations of XML documents to \
>> +strings, files, and other flat representations. It handles charset encodings, \
>> +XML escaping conventions, and so forth. It is still considered alpha, \
>> +although it has been put to limited use in settings such as XML::LibXML and \
>> +the AxKit XML Application Server. \
>> +"
>> +SECTION = "libs"
>> +LICENSE = "Artistic-1.0 | GPLv1+"
>> +HOMEPAGE = "http://search.cpan.org/dist/XML-SAX-Writer/"
>> +DEPENDS += "libxml-filter-buffertext-perl-native"
>> +RDEPENDS_${PN} += "libxml-filter-buffertext-perl"
>> +
>> +SRC_URI = "http://search.cpan.org/CPAN/authors/id/P/PE/PERIGRIN/XML-SAX-Writer-${PV}.tar.gz"
>> +SRC_URI[md5sum] = "383139d76418a82b9800dc4f8b568891"
>> +SRC_URI[sha256sum] = "a1b4d959aed8f8337523c4cef4b431e56e619c795dc6f99a868548952101cf3d"
>> +
>> +LIC_FILES_CHKSUM = "file://README;beginline=45;endline=46;md5=d41d8cd98f00b204e9800998ecf8427e"
>> +
>> +S = "${WORKDIR}/XML-SAX-Writer-${PV}"
>> +
>> +inherit cpan allarch
>> +
>> +BBCLASSEXTEND = "native"
>> --
>> 1.7.10.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>

-- 
Best Reagrds,
Roy | RongQing Li

