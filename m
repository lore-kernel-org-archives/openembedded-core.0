Return-Path: <aborduno@cisco.com>
X-Greylist: delayed 601 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 15 Nov 2016 15:15:39 UTC
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
	by mail.openembedded.org (Postfix) with ESMTP id 1415A6E650
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 15:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=2303; q=dns/txt; s=iport;
	t=1479222944; x=1480432544;
	h=subject:references:to:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=1Fu1109+FX0tuKh2j/p7K9s1hhyIMLYdc+rTsMip1ss=;
	b=MqUrc0Umz3R0w1TNPksOfp/4Nj4ufOks+sOPUeMUOv4n2228Ct4eOdPh
	CFk/N5Ck2K4dSQfAJHKCrZQk535vZnhGoPpufT4gyrK/Io9fa+Hu4pUhh
	Avaj5GcU8qpussz8GpvE71KY0rvuyKFUGGf5QQJRTJyUSo7AcQEKeKJKr Y=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BLBQD6IitY/4YNJK1dGgEBAQECAQEBA?=
	=?us-ascii?q?QgBAQEBgzcBAQEBAR+BBFSkSZAbgjiCD4IHhiMCgiBAEwECAQEBAQEBAWIohGI?=
	=?us-ascii?q?BAQQEHAQRAgFRCxgDKAMqLRMGAgEBiGiwKwyCKItQAQEBAQYngQqFMoF9CIJVh?=
	=?us-ascii?q?RSCOYJcAQSaQYlLBYcSkCJJkQggAjOBBByDV4FHPDSIGgEBAQ?=
X-IronPort-AV: E=Sophos;i="5.31,495,1473120000"; d="scan'208";a="348554170"
Received: from alln-core-12.cisco.com ([173.36.13.134])
	by alln-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
	15 Nov 2016 15:05:38 +0000
Received: from kbp1-dhp-f50810.synapse.com ([10.24.26.152])
	(authenticated bits=0)
	by alln-core-12.cisco.com (8.14.5/8.14.5) with ESMTP id uAFF5Z7R004027
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 15:05:37 GMT
References: <1476118955-12401-1-git-send-email-aborduno@cisco.com>
	<2f612347-5351-fc20-956e-1cf84a5189ff@cisco.com>
To: openembedded-core@lists.openembedded.org
From: Andrii Bordunov <aborduno@cisco.com>
Message-ID: <3c0307d1-0781-1d32-9a86-e5ff6fb44a2d@cisco.com>
Date: Tue, 15 Nov 2016 17:05:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <2f612347-5351-fc20-956e-1cf84a5189ff@cisco.com>
X-Authenticated-User: aborduno
Subject: Re: [PATCH] package.bbclass: allow using EXCLUDE_FROM_SHLIBS for subpackages
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
X-List-Received-Date: Tue, 15 Nov 2016 15:15:42 -0000
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: 7bit

Ping-2. Guys? Anything?


Thank you,
Andrii

On 19.10.16 16:58, Andrii Bordunov wrote:
> Ping? Any comments?
>
>
>
> Thank you,
> Andrii
>
> On 10.10.16 20:02, Andrii Bordunov wrote:
>> Some packages containing shared libraries might be registered
>> as shlib providers when they shouldn't (for example, the lib is for
>> their private use and must not generate any dependency).
>>
>> EXCLUDE_FROM_SHLIBS is targeted at that, but it could be set
>> for entire recipe only.
>>
>> This patch expands EXCLUDE_FROM_SHLIBS usage, so now it's possible
>> to set it in a style similar with RDEPENDS. For example:
>>  EXCLUDE_FROM_SHLIBS_${PN}-ptest = "1"
>>
>> Signed-off-by: Andrii Bordunov <aborduno@cisco.com>
>> ---
>>  meta/classes/package.bbclass | 12 ++++++++++--
>>  1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
>> index a6f0a7a..9bf43dc 100644
>> --- a/meta/classes/package.bbclass
>> +++ b/meta/classes/package.bbclass
>> @@ -1499,6 +1499,14 @@ python package_do_shlibs() {
>>      libdir_re = re.compile(".*/%s$" % d.getVar('baselib', True))
>>
>>      packages = d.getVar('PACKAGES', True)
>> +
>> +    shlib_pkgs = []
>> +    for pkg in packages.split():
>> +        if d.getVar('EXCLUDE_FROM_SHLIBS_' + pkg, 0):
>> +            bb.note("not generating shlibs for %s" % pkg)
>> +        else:
>> +            shlib_pkgs.append(pkg)
>> +
>>      targetos = d.getVar('TARGET_OS', True)
>>
>>      workdir = d.getVar('WORKDIR', True)
>> @@ -1614,7 +1622,7 @@ python package_do_shlibs() {
>>      needed = {}
>>      shlib_provider = oe.package.read_shlib_providers(d)
>>
>> -    for pkg in packages.split():
>> +    for pkg in shlib_pkgs:
>>          private_libs = d.getVar('PRIVATE_LIBS_' + pkg, True) or
>> d.getVar('PRIVATE_LIBS', True) or ""
>>          private_libs = private_libs.split()
>>          needs_ldconfig = False
>> @@ -1684,7 +1692,7 @@ python package_do_shlibs() {
>>
>>      libsearchpath = [d.getVar('libdir', True),
>> d.getVar('base_libdir', True)]
>>
>> -    for pkg in packages.split():
>> +    for pkg in shlib_pkgs:
>>          bb.debug(2, "calculating shlib requirements for %s" % pkg)
>>
>>          deps = list()
>>

