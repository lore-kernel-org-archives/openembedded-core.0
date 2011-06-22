Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QZWuv-0008Bc-Lf
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 01:33:06 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QZWrT-0004p1-GU from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 16:29:31 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 22 Jun 2011 16:24:11 -0700
Received: from [172.30.80.125] (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.1.289.1;
	Wed, 22 Jun 2011 16:29:30 -0700
Message-ID: <4E027AC4.1090905@mentor.com>
Date: Wed, 22 Jun 2011 16:29:08 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1308706423.git.raj.khem@gmail.com>	<1308758279.20015.79.camel@rex>	<4E0235DA.8060200@windriver.com>
	<4E025052.6070300@windriver.com>	<BANLkTin7j9VwfP_sF69j_U=T-ZkUj12V=A@mail.gmail.com>	<1308783588.20015.104.camel@rex>
	<BANLkTikvngN7Xv5jSrPzebiJ_2Pf8pRn+Q@mail.gmail.com>
In-Reply-To: <BANLkTikvngN7Xv5jSrPzebiJ_2Pf8pRn+Q@mail.gmail.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 22 Jun 2011 23:24:11.0219 (UTC)
	FILETIME=[7DE58A30:01CC3133]
Subject: Re: [PATCH 0/4] eglibc 2.14 upgrade
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
X-List-Received-Date: Wed, 22 Jun 2011 23:33:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 06/22/2011 04:22 PM, Khem Raj wrote:
> On Wed, Jun 22, 2011 at 3:59 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Wed, 2011-06-22 at 15:31 -0700, Khem Raj wrote:
>>> On Wed, Jun 22, 2011 at 1:28 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>>>> On 6/22/11 1:35 PM, Mark Hatle wrote:
>>>>> Since applying this update, I'm not longer getting an rpc/rpc.h file, which
>>>>> breaks various things like busybox mount.
>>>>>
>>>>> Is anyone else seeing this behavior?
>>>>
>>>> Reverting:
>>>>
>>>> 2a68cf4d315cdd18766de0c75928ff17846a6cd7 and
>>>> 190a946e9a4213944e3ee675c4b3e18701698e87
>>>>
>>>> fixed the problem for me.  So there is definitely a problems in the upgrade.
>>>>
>>>
>>> onward looking rpc is now maintained with libtirpc starting glibc 2.14 rpc is
>>> not to be used from bundled code in glibc. If we dont have recipes for libtirpc
>>> then I will add that.
>>
>> There looks to be more than this wrong with this update. A quick
>> comparison shows the following changes in the list of files being
>> installed from do_install:
>>
>> -./lib/libmemusage.so
>> -./lib/libnss_hesiod-2.13.so
>> -./lib/libnss_nisplus-2.13.so
>> -./lib/libutil-2.13.so
>> -./lib/libresolv-2.13.so
>> -./lib/libm-2.13.so
>> -./lib/libnsl-2.13.so
>> -./lib/libnss_compat-2.13.so
>> -./lib/libnss_nis-2.13.so
>> -./lib/libnss_dns-2.13.so
>> -./lib/libanl-2.13.so
>> -./lib/libBrokenLocale-2.13.so
>> -./lib/libcrypt-2.13.so
>> -./etc/rpc
>> -./usr/lib/libnss_compat_pic.a
>> -./usr/lib/libnss_dns_pic.a
>> -./usr/lib/libnss_nisplus_pic.a
>> +./usr/lib/audit/sotruss-lib.so
>> -./usr/lib/libutil_pic.map
>> -./usr/lib/libBrokenLocale_pic.a
>> -./usr/lib/libBrokenLocale.a
>> -./usr/lib/libBrokenLocale_pic.map
>> -./usr/lib/libm.a
>> -./usr/lib/libnss_dns_pic.map
>> -./usr/lib/libm_pic.map
>> -./usr/lib/libnss_hesiod_pic.map
>> -./usr/lib/librpcsvc.a
>> -./usr/lib/libutil.a
>> -./usr/lib/libnss_compat_pic.map
>> -./usr/lib/libcrypt.a
>> -./usr/lib/libutil_pic.a
>> -./usr/lib/libanl.a
>> -./usr/lib/libnsl_pic.a
>> -./usr/lib/libresolv.a
>> -./usr/lib/libnss_hesiod_pic.a
>> -./usr/lib/libm_pic.a
>> -./usr/lib/libnsl_pic.map
>> -./usr/lib/libnss_nis_pic.map
>> -./usr/lib/libanl_pic.a
>> -./usr/lib/libcrypt_pic.map
>> -./usr/lib/libcrypt_pic.a
>> -./usr/lib/libnss_nis_pic.a
>> -./usr/lib/libresolv_pic.map
>> -./usr/lib/libresolv_pic.a
>> -./usr/lib/libanl_pic.map
>> -./usr/lib/libnss_nisplus_pic.map
>> -./usr/lib/libnsl.a
>> -./usr/bin/rpcgen
>> -./usr/bin/gencat
>> +./usr/bin/sotruss
>> -./usr/bin/localedef
>> -./usr/bin/locale
>> -./usr/sbin/rpcinfo
>> -./usr/sbin/nscd
>>
>> Some of these are rpc related but there are other issues too.
>>
>> I've reverted the upgrade itself for now until we have something in
>> place to address the issues and its actually had some testing...
>>
> 
> some of these are due to rpc and others are due to nss being removed
> I need to backport the nss db re-implementation then most of it should
> be resolved
> I guess I will post 2.14 as additional recipes rather than replacement for 2.13
> that way we will get some soak time.

Neither of those would explain the locale problem Otavio and I have seen:
NOTE: generating locale wae_CH (UTF-8)
NOTE: cmd:
NOTE:
PATH="/home/trini/work/tmp/oe-core-template/build-eglibc/sysroots/x86_64-linux/usr/bin/i586-oe-linux.gcc-cross-intermediate:/home/trini/work/tmp/oe-core-template/build-eglibc/sysroots/x86_64-linux/usr/bin/i586-oe-linux:/home/trini/work/tmp/oe-core-template/build-eglibc/sysroots/qemux86/usr/bin/crossscripts:/home/trini/work/tmp/oe-core-template/build-eglibc/sysroots/x86_64-linux/usr/sbin:/home/trini/work/tmp/oe-core-template/build-eglibc/sysroots/x86_64-linux/usr/bin:/home/trini/work/tmp/oe-core-template/build-eglibc/sysroots/x86_64-linux/sbin:/home/trini/work/tmp/oe-core-template/build-eglibc/sysroots/x86_64-linux//bin:/home/trini/work/tmp/oe-core-template/oe-core/scripts:/home/trini/work/tmp/oe-core-template/bitbake/bin:/home/trini/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/trini/bin:/home/trini/work/tmp/oe-core-template/oe-core/scripts"
I18NPATH="/home/trini/work/tmp/oe-core-template/build-eglibc/work/i586-oe-linux/eglibc-2.14-r0+svnr14285/locale-tree/usr/share/i18n"
GCONV_PATH="/home/trini/work/tmp/oe-core-template/build-eglibc/work/i586-oe-linux/eglibc-2.14-r0+svnr14285/locale-tree/iconvdata"
cross-localedef  --uint32-align=4 --little-endian  --force --old-style
--no-archive
--prefix=/home/trini/work/tmp/oe-core-template/build-eglibc/work/i586-oe-linux/eglibc-2.14-r0+svnr14285/locale-tree
--inputfile=/home/trini/work/tmp/oe-core-template/build-eglibc/work/i586-oe-linux/eglibc-2.14-r0+svnr14285/locale-tree//usr/share/i18n/locales/wae_CH
--charmap=UTF-8
/home/trini/work/tmp/oe-core-template/build-eglibc/work/i586-oe-linux/eglibc-2.14-r0+svnr14285/locale-tree/usr/lib/locale/wae_CH
NOTE: stdout:
NOTE:
NOTE: stderr:
NOTE: LC_ADDRESS: terminology language code `wae' not defined
LC_ADDRESS: language abbreviation `wae' not defined
ERROR: Function 'localedef returned an error' failed

-- 
Tom Rini
Mentor Graphics Corporation


