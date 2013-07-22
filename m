Return-Path: <andre.draszik@linaro.org>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 43FC562009
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 08:22:36 +0000 (UTC)
Received: by mail-qc0-f182.google.com with SMTP id e10so3447109qcy.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 01:22:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:subject:from:to:date:in-reply-to:references:content-type
	:x-mailer:content-transfer-encoding:mime-version:x-gm-message-state;
	bh=SsZcoHtgldbHDgvZwbrZLxxfL7SVvR99SaeFIE+wwjA=;
	b=PtwyCHjdEvwPLNAheT/gdWg3JI3BDBK+t7RbOtj4VXBRGDMrimZ259qT1vDLe3v3Wm
	HiH7nt7ARsCxyErSF2km1vAvYiqbicFQNOtmI+vHIofDkUd/IDixMHWboh9VrkmipLKK
	7Hd1OjvUIACKmN38AsqyLKBAi0AfQ0QFbCJbccMXb4FlAVBukf0HJuCk5yd4XnNy2Vfh
	AMk3GKgisEFMjL/pvjPFotxbECeF0GYRf55Dhlt1Z//XYvWpYOs9xPxVO5HvSDPnk4Xv
	qeXeYL0DA1CjoOGEOUAl34IEMqrLruXJeR0G0VjN4u+xq2qJKhCYRI7HrOam7QlnDQb1
	4Omw==
X-Received: by 10.49.11.168 with SMTP id r8mr31393657qeb.34.1374481356489;
	Mon, 22 Jul 2013 01:22:36 -0700 (PDT)
Received: from [10.65.4.44] (git.linaro.org. [54.235.93.228])
	by mx.google.com with ESMTPSA id t5sm2466947qae.9.2013.07.22.01.22.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 22 Jul 2013 01:22:35 -0700 (PDT)
Message-ID: <1374481350.6719.83.camel@bril0118.bri.st.com>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jul 2013 09:22:30 +0100
In-Reply-To: <3185bfa72aaa8acd02d32f67ee51de79a24c7c19.1374479372.git.kai.kang@windriver.com>
References: <cover.1374479372.git.kai.kang@windriver.com>
	<3185bfa72aaa8acd02d32f67ee51de79a24c7c19.1374479372.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Gm-Message-State: ALoCoQmMi4ZzR6EvV3AwlTttzF8m4mWQoK+DzPIaoR4vXfHdue1uPQwbZMWKIar2jA2RRCnEvHm5
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
X-List-Received-Date: Mon, 22 Jul 2013 08:22:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

Instead of penalising everybody, would it be possible to make this
change dependent on the build machine (ram + swap)? Or to only add
-Wl,--no-keep-memory if the build failed without it?

Not sure if it would make any difference, but do you see this only with
full debug enabled (-ggdb)? If yes, can the debug flags be changed, or
that linker flag only be added, if full debug is enabled?


Cheers,
Andre'

On Mon, 2013-07-22 at 15:51 +0800, Kai Kang wrote:
> Build webkit-gtk occupies lot of memory and fails on some host:
> | ...tmp/sysroots/i686-linux/usr/libexec/x86_64-wrs-linux/gcc/x86_64-wrs-linux/4.8.1/ld:
> failed to set dynamic section sizes: Memory exhausted
> | collect2: error: ld returned 1 exit status
> | make[1]: *** [libwebkitgtk-1.0.la] Error 1
> 
> Add ld option to fix it.
> 
> Refer to:
> http://comments.gmane.org/gmane.os.opendarwin.webkit.devel/20078
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
> index 5691d3f..90625a3 100644
> --- a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
> +++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
> @@ -60,6 +60,8 @@ CPPFLAGS_append_powerpc = " -I${STAGING_INCDIR}/pango-1.0 \
>  
>  EXTRA_AUTORECONF = " -I Source/autotools "
>  
> +# Fix compile error: "ld: failed to set dynamic section sizes: Memory exhausted"
> +LDFLAGS += " -Wl,--no-keep-memory"
>  
>  #| ./Source/JavaScriptCore/heap/HandleTypes.h: In static member function 'static T* JSC::HandleTypes<T>::getFromSlot(JSC::HandleSlot) [with T = JSC::Structure, JSC::HandleTypes<T>::ExternalType = JSC::Structure*, JSC::HandleSlot = JSC::JSValue*]':
>  #| ./Source/JavaScriptCore/heap/Handle.h:141:79:   instantiated from 'JSC::Handle<T>::ExternalType JSC::Handle<T>::get() const [with T = JSC::Structure, JSC::Handle<T>::ExternalType = JSC::Structure*]'



