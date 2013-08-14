Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4B9576B67D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 09:27:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7E9RoTV012640
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 14 Aug 2013 02:27:50 -0700 (PDT)
Received: from [128.224.162.168] (128.224.162.168) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 14 Aug 2013 02:27:49 -0700
Message-ID: <520B4D9A.1010304@windriver.com>
Date: Wed, 14 Aug 2013 17:27:54 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1376379182.git.rongqing.li@windriver.com>
	<02e6f25c210b0628dc4ee4482474b0e6ce5606e4.1376379182.git.rongqing.li@windriver.com>
	<520A82BA.2070706@linux.intel.com>
	<520B1595.3060909@windriver.com> <20130814065609.GQ17945@jama>
In-Reply-To: <20130814065609.GQ17945@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sstate.bbclass: fix parallel building issue
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
X-List-Received-Date: Wed, 14 Aug 2013 09:27:50 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/14/2013 02:56 PM, Martin Jansa wrote:
> On Wed, Aug 14, 2013 at 01:28:53PM +0800, Rongqing Li wrote:
>>
>>
>> On 08/14/2013 03:02 AM, Saul Wold wrote:
>>> On 08/13/2013 01:20 AM, rongqing.li@windriver.com wrote:
>>>> From: "Roy.Li" <rongqing.li@windriver.com>
>>>>
>>>> sstate_package creates hardlink from sysroot to SSTATE_BUILDDIR, then
>>>> sstate_create_package will store SSTATE_BUILDDIR into a archive file by
>>>> tar, but once other packages install the same file into sysroot, the
>>>> creating the archive file will fail with below error:
>>>>
>>>>       DEBUG: Executing shell function sstate_create_package
>>>>       tar: x86_64-linux/usr/share/aclocal/xorg-macros.m4: file changed
>>>> as we read it
>>>>
>>>> This kind of error is harmless, use --ignore-failed-read to ignore it.
>>>>
>>> I am not sure it's so harmless, what if the file is corrupted, then we
>>> have a bad sstate tarball.  You have identified the part of the root
>>> cause being the hardlink, but what if the file actually does change
>>> (which would be a different bug potentially), then your packaging a
>>> differet set of macros (in this case) with the sysroot.
>>>
>>>
>>> Sau!
>>
>>
>> The file is not corrupted, and the file content is not changed,  "tar"
>> said xorg-macros.m4 file is changed, since the number of links of
>> xorg-macros.m4 has changed when other packages is doing configuration
>> and call autotools_copy_aclocal to make a hardlink to ${ACLOCALDIR}
>>
>> If this fix can be accepted, I will rework the commit header.
>
> I think there is still some other issue.
>
> I haven't seen this on ext4 filesystems, but with reiserfs I was able to
> reproduce "cp: will not create hard link" issue, e.g.:
>
> do_populate_lic_setscene task failing in sstate_install with
> cp: will not create hard link `/OE/deploy/licenses/recipe' to directory `/OE/deploy/licenses/recipe' (same path)
>
> or
> ERROR: Error executing a python function in pn.bb:
> CalledProcessError: Command 'cp -afl /OE/work/armv7a-vfp-neon-oe-linux-gnueabi/pn/1.0/pkgdata/* /OE/pkgdata/armv7a-vfp-neon-oe-linux-gnueabi' returned non-zero exit status 1 with output
> cp: warning: source file `/OE/work/armv7a-vfp-neon-oe-linux-gnueabi/pn/1.0/pkgdata/pn' specified more than once
>
> cp: will not create hard link `/OE/pkgdata/armv7a-vfp-neon-oe-linux-gnueabi/runtime' to directory `/OE/pkgdata/armv7a-vfp-neon-oe-linux-gnueabi/runtime'
> cp: will not create hard link `/OE/pkgdata/armv7a-vfp-neon-oe-linux-gnueabi/runtime-reverse' to directory `/OE/pkgdata/armv7a-vfp-neon-oe-linux-gnueabi/runtime-reverse'
> cp: will not create hard link `/OE/pkgdata/armv7a-vfp-neon-oe-linux-gnueabi/shlibs' to directory `/OE/pkgdata/armv7a-vfp-neon-oe-linux-gnueabi/shlibs'
>
> Number of hardlinks is:
> $ find pn/1.0/pkgdata -printf "%f/%n/%i\n"
> pkgdata/5/190867045
> runtime-reverse/2/190867046
> pn-dbg/1/190867047
> pn-dev/1/190867048
> pn-doc/1/190867049
> pn/1/190867067
> pn-staticdev/1/190867051
> pn-locale/1/190867078
> runtime/2/190867053
> pn-dbg.packaged/1/190867054
> pn-dev.packaged/1/190867056
> pn-dbg/1/190867057
> pn-dev/1/190867058
> pn-doc/1/190867059
> pn/1/190867060
> pn-staticdev/1/190867062
> pn.packaged/1/190867063
> pn-locale/1/190867064
> pn/1/190867065
> shlibs/2/190867069
>
> find ~ -xdev -samefile pn/1.0/pkgdata 2>/dev/null
> pn/1.0/pkgdata
>
> I'm not sure where the other pkgdata hardlinks came from.
>
> The problem is that I can reproduce it on 1-2 random recipes from few hundreds
> included in bigger image and even not in every build. After the error is shown
> it all looks sane, only way to manually reproduce the same error is to really
> specify source dirs twice:
>
> $ cp -afl \
> /OE/work/armv7a-vfp-neon-oe-linux-gnueabi/pn/1.0/pkgdata/* \
> /OE/work/armv7a-vfp-neon-oe-linux-gnueabi/pn/1.0/pkgdata/* \
> /OE/pkgdata/armv7a-vfp-neon-oe-linux-gnueabi
>
> shows exactly the same 1 warning and 3 errors.
>

Your problem seems filesystem issue.

Could you add more debug? like strace result.

-Roy


-- 
Best Reagrds,
Roy | RongQing Li

