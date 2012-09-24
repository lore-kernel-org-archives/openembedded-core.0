Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TGG5v-0001BZ-Q9
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 23:21:35 +0200
Received: by lbky2 with SMTP id y2so4118949lbk.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 14:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=I7IjYaWxGrkPpgIyzwt/a8hG5oCEenCr/2vLLtWeA2c=;
	b=j6/pggQGdOg4kmf40ntifSXbsmsugEc8ALxtMw8ucp9LrYuaGPX2cJT4lCP7w4Z3aL
	idWgWuotlmsThFYUTC+KXRvNRqxIZJKBWOPWvr9KQNFKK39SvDIXSvh6mUAaKVaxowgq
	darWWXq/r6WzvSsUsj8FbwSAz+/3NMeH62r4W2e2sjBxia0uBV1csBMqqO3DNmPyefE5
	NdRvAxBKkpVDxjG+teYYv22IN9GOIGdu6LSn+DVQRFSakgkgh8AOFOzsvzl3zxP5B2Nj
	F0O+wno4NvPVfD61SClmAsKtqXmEEk4Dc1Wz0QMid6RRaGVRJMU6NsyjCTWcoWC/h7YQ
	tNdA==
Received: by 10.152.132.133 with SMTP id ou5mr11666470lab.45.1348520927420;
	Mon, 24 Sep 2012 14:08:47 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.19.2 with HTTP; Mon, 24 Sep 2012 14:08:27 -0700 (PDT)
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A6A2E00@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1348516546-26005-1-git-send-email-msm@freescale.com>
	<1348516546-26005-2-git-send-email-msm@freescale.com>
	<70CC66F5C30A414DADDA6973E4CA391A6A2E00@039-SN1MPN1-001.039d.mgd.msft.net>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 24 Sep 2012 14:08:27 -0700
X-Google-Sender-Auth: c6hkhMFnLdaw6vNen2Y0HN5_s9w
Message-ID: <CABcZAN=8O1fD3QAm8ypA0RKV_OUSJoiEu96Gg8dQSW9QwPbWMg@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] libx11: fix nativesdk build on older distros
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
X-List-Received-Date: Mon, 24 Sep 2012 21:21:35 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 24, 2012 at 1:13 PM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
> On Mon, Sep 24, 2012 at 2:55 PM, Matthew McClintock <msm@freescale.com> wrote:
>> makekeys-makekeys.o: In function `main':
>> makekeys.c:(.text+0x85): undefined reference to `__isoc99_sscanf'
>> makekeys.c:(.text+0xa7): undefined reference to `__isoc99_sscanf'
>> collect2: ld returned 1 exit status
>> make: *** [makekeys] Error 1
>>
>> Older libc do not have this defined, we can use the -D_GNU_SOURCE
>> to the compiler to prevent generating calls to this function and
>> make linking work
>>
>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>> ---
>>  .../xorg-lib/libx11/use_host_cc_for_utils.patch    |   12 ++++++++++++
>>  meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb     |    3 ++-
>>  2 files changed, 14 insertions(+), 1 deletion(-)
>>  create mode 100644 meta/recipes-graphics/xorg-lib/libx11/use_host_cc_for_utils.patch
>>
>> diff --git a/meta/recipes-graphics/xorg-lib/libx11/use_host_cc_for_utils.patch b/meta/recipes-graphics/xorg-lib/libx11/use_host_cc_for_utils.patch
>> new file mode 100644
>> index 0000000..08ba39a
>> --- /dev/null
>> +++ b/meta/recipes-graphics/xorg-lib/libx11/use_host_cc_for_utils.patch
>> @@ -0,0 +1,12 @@
>> +Index: libX11-1.5.0/src/Makefile.am
>> +===================================================================
>> +--- libX11-1.5.0.orig/src/Makefile.am
>> ++++ libX11-1.5.0/src/Makefile.am
>> +@@ -420,6 +420,6 @@ ks_tables.h: $(KEYSYMDEFS) $(top_builddi
>> +       mv ks_tables_h $@
>> +
>> + $(top_builddir)/src/util/makekeys$(EXEEXT): force
>> +-      cd util && $(MAKE)
>> ++      cd util && $(MAKE) CC=gcc CCLD=gcc LDFLAGS= CFLAGS=-D_GNU_SOURCE

Isn't the makekeys build already using CC_FOR_BUILD? That's what is
implied by the libx11.inc export of those variables. So it seems a bit
unnecessary to pass in gcc expliciltly.
-- 
Christopher Larson


