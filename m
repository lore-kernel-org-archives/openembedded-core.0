Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4C8B66065F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 02:19:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6O2JtJv008063
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 23 Jul 2013 19:19:55 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Tue, 23 Jul 2013 19:19:54 -0700
Message-ID: <51EF39C7.2060703@windriver.com>
Date: Wed, 24 Jul 2013 10:19:51 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcsOpIERyYXN6aWs=?= <andre.draszik@linaro.org>
References: <cover.1374479372.git.kai.kang@windriver.com>
	<3185bfa72aaa8acd02d32f67ee51de79a24c7c19.1374479372.git.kai.kang@windriver.com>
	<1374481350.6719.83.camel@bril0118.bri.st.com>
In-Reply-To: <1374481350.6719.83.camel@bril0118.bri.st.com>
X-Originating-IP: [128.224.162.231]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] webkit-gtk: fix 'Memory exhausted' error
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
X-List-Received-Date: Wed, 24 Jul 2013 02:19:56 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2013年07月22日 16:22, André Draszik wrote:
> Hi,
>
> Instead of penalising everybody, would it be possible to make this
> change dependent on the build machine (ram + swap)? Or to only add
> -Wl,--no-keep-memory if the build failed without it?

Yes, it doesn't fail on every build machine. But it seems that build 
fails randomly on different build machines.

>
> Not sure if it would make any difference, but do you see this only with
> full debug enabled (-ggdb)? If yes, can the debug flags be changed, or
> that linker flag only be added, if full debug is enabled?

webkit-gtk set configure option "--enable-debug=no" to turn off debug. 
And no such "-ggdb" flags.

Thanks,
Kai

>
>
> Cheers,
> Andre'
>
> On Mon, 2013-07-22 at 15:51 +0800, Kai Kang wrote:
>> Build webkit-gtk occupies lot of memory and fails on some host:
>> | ...tmp/sysroots/i686-linux/usr/libexec/x86_64-wrs-linux/gcc/x86_64-wrs-linux/4.8.1/ld:
>> failed to set dynamic section sizes: Memory exhausted
>> | collect2: error: ld returned 1 exit status
>> | make[1]: *** [libwebkitgtk-1.0.la] Error 1
>>
>> Add ld option to fix it.
>>
>> Refer to:
>> http://comments.gmane.org/gmane.os.opendarwin.webkit.devel/20078
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
>> index 5691d3f..90625a3 100644
>> --- a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
>> +++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
>> @@ -60,6 +60,8 @@ CPPFLAGS_append_powerpc = " -I${STAGING_INCDIR}/pango-1.0 \
>>   
>>   EXTRA_AUTORECONF = " -I Source/autotools "
>>   
>> +# Fix compile error: "ld: failed to set dynamic section sizes: Memory exhausted"
>> +LDFLAGS += " -Wl,--no-keep-memory"
>>   
>>   #| ./Source/JavaScriptCore/heap/HandleTypes.h: In static member function 'static T* JSC::HandleTypes<T>::getFromSlot(JSC::HandleSlot) [with T = JSC::Structure, JSC::HandleTypes<T>::ExternalType = JSC::Structure*, JSC::HandleSlot = JSC::JSValue*]':
>>   #| ./Source/JavaScriptCore/heap/Handle.h:141:79:   instantiated from 'JSC::Handle<T>::ExternalType JSC::Handle<T>::get() const [with T = JSC::Structure, JSC::Handle<T>::ExternalType = JSC::Structure*]'
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


-- 
Regards,
Neil | Kai Kang


