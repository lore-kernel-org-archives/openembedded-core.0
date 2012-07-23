Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Randy.MacLeod@windriver.com>) id 1StCnv-000521-4G
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 09:11:46 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6N3OTJH002275
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jul 2012 20:24:29 -0700 (PDT)
Received: from [128.224.22.136] (128.224.22.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Sun, 22 Jul 2012 20:24:28 -0700
Message-ID: <500CC3EA.2030000@windriver.com>
Date: Sun, 22 Jul 2012 23:24:26 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>, "Huang, Jie (Jackie)"
	<Jackie.Huang@windriver.com>
References: <cover.1342939738.git.jackie.huang@windriver.com>
	<9c2d0c1746a945290b6c64551fc6ca2e5e043028.1342939738.git.jackie.huang@windriver.com>,
	<1342946215.21788.53.camel@ted>
	<1B858668EC6A94408DCA5225FDFA85AA575F4CD3@ALA-MBA.corp.ad.wrs.com>
	<500CAF3B.1020001@windriver.com>
In-Reply-To: <500CAF3B.1020001@windriver.com>
X-Originating-IP: [128.224.22.136]
Subject: Re: [PATCH 1/1] useradd.bbclass: use locking of bb.utils to avoid lock race issue of useradd/groupadd
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
X-List-Received-Date: Mon, 23 Jul 2012 07:11:46 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-07-22 09:56 PM, Randy MacLeod wrote:
> On 12-07-22 08:10 AM, Huang, j (Jackie) wrote:
>>
>>
>>> On Sun, 2012-07-22 at 14:53 +0800, jackie.huang@windriver.com wrote:
>>>> From: Jackie Huang <jackie.huang@windriver.com>
>>>>
>>>> A race condition can occur when adding users and groups to the
>>>> passwd and group files, in [YOCTO #1794], 10 times retry added
>>>> but it is not fixed completely.
>>>>
>>>> This fix re-writes the useradd_preinst and useradd_sysroot with
>>>> python and use locking of bb.utils to lock the passwd and group
>>>> files before executing useradd/groupadd commands to avoid the
>>>> lock race themselves.
>>>>
>>>> [YOCTO #2779]
>>>>
>>>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>>>> ---
>>>>   meta/classes/useradd.bbclass |  284
>>>> ++++++++++++++++++------------------------
>>>>   1 files changed, 124 insertions(+), 160 deletions(-)
>>>
>>> Please resend this with the whitespace issues resolved. Its near
>>> impossible to review as it stands :(
>>
>> Re-sent, sorry about that.
>
> Hi Jackie,
>
> I don't see that your new version sent at 8:01 is any better
> but I could be wrong...
>
> Robert,
> Please take a look and help Jackie with formatting
> and perhaps small single purpose commits as needed -
> i.e. separate the whitespace changes from the functional changes.

Summary:
    Jackie did the right thing; I need to read more carefully. ;-)

// Randy

Details:

I've looked at the two emails more closely now and see the
white space problem lines and saw that Jackie did fix those up
in the new patch. Specifically:

-USERADDSETSCENEDEPS = "${MLPREFIX}base-passwd:do_populate_sy
+USERADDSETSCENEDEPS = "base-passwd:do_populate_sysroot_setsc
  USERADDSETSCENEDEPS_virtclass-cross = ""
  USERADDSETSCENEDEPS_virtclass-native = ""
  USERADDSETSCENEDEPS_virtclass-nativesdk = ""
@@ -154,61 +118,61 @@ do_package_setscene[depends] = "${USERA

  # Recipe parse-time sanity checks
  def update_useradd_after_parse(d):
-    useradd_packages = d.getVar('USERADD_PACKAGES', True)
+       useradd_packages = d.getVar('USERADD_PACKAGES', True)

-    if not useradd_packages:
-        raise bb.build.FuncFailed, "%s inherits useradd but
+       if not useradd_packages:
+               raise bb.build.FuncFailed, "%s inherits usera

-    for pkg in useradd_packages.split():
-        if not d.getVar('USERADD_PARAM_%s' % pkg, True) and
-            raise bb.build.FuncFailed, "%s inherits useradd
+       for pkg in useradd_packages.split():
+               if not d.getVar('USERADD_PARAM_%s' % pkg, Tru
+                       raise bb.build.FuncFailed, "%s inheri

  python __anonymous() {
-    update_useradd_after_parse(d)
+       update_useradd_after_parse(d)
  }

Sorry for the noise.

// Randy



>
> This problem is happening frequently so I'd like to get this
> worked out upstream.
>
> Thanks,
> // Randy
>
>
>>
>> Thanks,
>> Jackie
>>
>>>
>>> Cheers,
>>>
>>> Richard
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
>


-- 
# Randy MacLeod. MTS, Linux, Wind River
Direct: 613.963.1350


