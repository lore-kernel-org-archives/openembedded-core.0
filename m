Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TEMQC-0000SM-1F
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 17:42:40 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Sep 2012 08:29:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,447,1344236400"; d="scan'208";a="194885716"
Received: from unknown (HELO [10.252.121.202]) ([10.252.121.202])
	by orsmga001.jf.intel.com with ESMTP; 19 Sep 2012 08:29:56 -0700
Message-ID: <5059E4F4.3040703@intel.com>
Date: Wed, 19 Sep 2012 18:29:56 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1348052899.git.laurentiu.palcu@intel.com>
	<5ad9edce72b7300237251048d1cddc22259d496f.1348052899.git.laurentiu.palcu@intel.com>
	<CAMKF1soHduPtpm5rP8PGDUZVU=p9rV0FbJYtQsTbvOQA38sWSA@mail.gmail.com>
In-Reply-To: <CAMKF1soHduPtpm5rP8PGDUZVU=p9rV0FbJYtQsTbvOQA38sWSA@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC 5/7] gdk-pixbuf: generate the pixbuf loader's cache ar rootfs time
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
X-List-Received-Date: Wed, 19 Sep 2012 15:42:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 09/19/2012 04:30 PM, Khem Raj wrote:
> On Wed, Sep 19, 2012 at 4:49 AM, Laurentiu Palcu
> <laurentiu.palcu@intel.com> wrote:
>> This will generate the loaders.cache file for pixbuf, at rootfs time.
>>
>> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
>> ---
>>  meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb |   24 ++++++++++++--------
>>  1 file changed, 14 insertions(+), 10 deletions(-)
>>
>> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
>> index 99f6cb4..c4afb97 100644
>> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
>> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
>> @@ -57,18 +57,22 @@ FILES_${PN}-dbg += " \
>>
>>  postinst_pixbufloader () {
>>  if [ "x$D" != "x" ]; then
>> -    exit 1
>> +# Update the target's pixbuf loader's cache. Since the native binary will
>> +# throw an error if the shared objects do not belong to the same ELF class,
>> +# we trick the gdk-pixbuf-query-loaders into scanning the native shared
>> +# objects and then we remove the NATIVE_ROOT prefix from the paths in
>> +# loaders.cache.
>> +gdk-pixbuf-query-loaders $(find $D/${libdir}/gdk-pixbuf-2.0/2.10.0/loaders \
>> +        -name *.so | sed -e "s:$D:$NATIVE_ROOT:g") > \
>> +        $D/${libdir}/gdk-pixbuf-2.0/2.10.0/loaders.cache || exit 1
>> +
>> +sed -i -e "s:$NATIVE_ROOT:/:g" $D/${libdir}/gdk-pixbuf-2.0/2.10.0/loaders.cache
>> +
> 
> 
> 
> gdk-pixbuf-2.0/2.10.0 seems to be quite hardcoded. Can it be converted
> into something more general may be use wildcard appropriately ?
I will investigate and see if I can find a more generic solution.
Basically, I just wanted to be consistent with what was already there.
I'll see what I can do.

Thanks,
Laurentiu
> 
>> +exit 0
>>  fi
>>
>> -GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders gdk-pixbuf-query-loaders --update-cache
>> -
>> -if [ -x ${bindir}/gtk-update-icon-cache ] && [ -d ${datadir}/icons ]; then
>> -    for icondir in /usr/share/icons/*; do
>> -        if [ -d ${icondir} ]; then
>> -            gtk-update-icon-cache -t -q ${icondir}
>> -        fi
>> -    done
>> -fi
>> +# Update the pixbuf loaders in case they haven't been registered yet
>> +GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/2.10.0/loaders gdk-pixbuf-query-loaders --update-cache
>>  }
>>
>>  PACKAGES_DYNAMIC += "gdk-pixbuf-loader-*"
>> --
>> 1.7.9.5
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


