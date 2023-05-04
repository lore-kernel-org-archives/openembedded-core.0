Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FEFFC7EE26
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 12:00:46 +0000 (UTC)
Received: from mailrelay5-2.pub.mailoutpod2-cph3.one.com (mailrelay5-2.pub.mailoutpod2-cph3.one.com [46.30.211.186])
 by mx.groups.io with SMTP id smtpd.web11.47508.1683201639646544505
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 05:00:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa2 header.b=HnKoQehk;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.211.186, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa2;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:cc:to:
	 subject:mime-version:date:message-id:from;
	bh=WHTeQrxTMozvSH/5p32brpELh8uxMsT/jzTGCJKUwz4=;
	b=HnKoQehkhQSdSRhTB/4z4SR9NiLyD1dsTJSO2dXw3lFt6gN9VEUsqY0PnMlxe2MWHcSHR3YyiIa72
	 jehlQiYFes25JDED7ov35SkKLe/JBa6OO704r9wCkk50AS0FeYevqUTP7WUh0tb/m54tyQk9a9maZc
	 J/keh/ldiudKH8GnyjEsm6+JQNVjmTVpX3XZilTwt9gNvTEeXlCq9IPvx7CDJho+VIjALBluSXutsn
	 EEcvR0MU2hNU0D7Ajsd1bWDDJS0FkHx37PdB+tVcLVO5bIBz+/t90Ms7kl+BrAqLuzc2zEmlsVX5p9
	 4z+7b0IAw/RpOHx2YpPJv/r3N5SXZ8A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed2;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:cc:to:
	 subject:mime-version:date:message-id:from;
	bh=WHTeQrxTMozvSH/5p32brpELh8uxMsT/jzTGCJKUwz4=;
	b=SyCDbViJp6RGKfE/3AiB9jKFfv0LOUcHoNh+J064FLehpSQv+sYFf4aOW62QO148m3NprtDt5PCZm
	 2H6NcmcDA==
X-HalOne-ID: 4781f162-ea73-11ed-a272-231b2edd0ed2
Received: from [192.168.100.229] (c-799071d5.44006-0-69747578.bbcust.telenor.se [213.113.144.121])
	by mailrelay5 (Halon) with ESMTPSA
	id 4781f162-ea73-11ed-a272-231b2edd0ed2;
	Thu, 04 May 2023 12:00:36 +0000 (UTC)
Message-ID: <98af3b96-9d1c-3d6a-493f-c1d6a422f9e8@berginkonsult.se>
Date: Thu, 4 May 2023 14:00:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] [RFC] python3-cryptogaphy upgrade to 40.0.2 issues
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>, frederic.martinsons@gmail.com
Cc: Tim Orling <ticotimo@gmail.com>,
 openembedded-core <openembedded-core@lists.openembedded.org>
References: <CANx9H-B4seY487YwfvgW2ze_n6MWr73kJsOTc8spdou32qubKg@mail.gmail.com>
 <57f1224b-14c5-2ba4-c752-98dba8f57a21@berginkonsult.se>
 <CANNYZj-uE2WUvfZpjq67wHyeFqQaN1L7HYp54Fm99J5UzS8cdw@mail.gmail.com>
From: Peter Bergin <peter@berginkonsult.se>
In-Reply-To: <CANNYZj-uE2WUvfZpjq67wHyeFqQaN1L7HYp54Fm99J5UzS8cdw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 12:00:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180869


On 2023-05-04 11:00, Alexander Kanavin wrote:
> On Thu, 4 May 2023 at 10:41, Peter Bergin <peter@berginkonsult.se> wrote:
>
>> At
>> https://github.com/pyca/cryptography/blob/f816b457494e010b655cd7fdcd30e3446f86a703/src/rust/build.rs#L46
>> the path to python includes is defined by calling 'python3 -c "import
>> sysconfig; print(sysconfig.get_path('include'))"' (but from inside
>> rust). With print-debugging this seems to return the bad string
>> '/usr/include/python3.11' which is then passed to cc::Build
>>
>> I executed this in recipe context:
>>
>> do_compile:prepend() {
>>       which python3
>>       python3 -c "import sysconfig; print(sysconfig.get_path('include'))"
>> }
>>
>> and then I got the correct return value:
>>
>> |
>> /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/bin/python3-native/python3
>> |
>> /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/include/python3.11
> This is pointing to the native sysroot in a target build, so it is
> most likely not actually correct. I believe 'inherit
> python3targetconfig' may help, as it substitutes most places where
> native python gets queried by components with target-specific values.
>
> Alex
>
The bad thing is that the build.rs script is running python script to 
figure out the path to the headers. I'm not sure we can use target 
python exe in the build steps without running qemu instance or something 
which seems overkill in this case. We have the information about python 
include path for the target in the variable PYTHON_INCLUDE_DIR.

With this patch the compilation will find Python.h:

$ git diff src/rust/build.rs
diff --git a/src/rust/build.rs b/src/rust/build.rs
index 01177ac..7dc13fe 100644
--- a/src/rust/build.rs
+++ b/src/rust/build.rs
@@ -43,11 +43,8 @@ fn main() {
      )
      .unwrap();
      println!("cargo:rustc-cfg=python_implementation=\"{}\"", python_impl);
-    let python_include = run_python_script(
-        &python,
-        "import sysconfig; print(sysconfig.get_path('include'), end='')",
-    )
-    .unwrap();
+    let python_include = env::var("PYTHON_INCLUDE_DIR").unwrap();
+
      let openssl_include =
          std::env::var_os("DEP_OPENSSL_INCLUDE").expect("unable to find 
openssl include path");
      let openssl_c = Path::new(&out_dir).join("_openssl.c");


But it fails later in the linking step.

.....linux/python3-cryptography/40.0.2-r0/recipe-sysroot/usr/lib/rustlib/x86_64-poky-linux-gnu/lib" 
"-L" 
"/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/python3-cryptography-40.0.2/target/x86_64-poky-linux-gnu/release/build/cryptography-rust-aa00e39a952c07ee/out" 
"-L" 
"/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot/usr/lib" 
"-L" 
"/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/lib/rustlib/x86_64-poky-linux-gnu/lib" 
"-Wl,-Bstatic" "-l_openssl.a" 
"/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot/usr/lib/rustlib/x86_64-poky-linux-gnu/lib/libcompiler_builtins-45df5d471f0d20d0.rlib" 
"-Wl,-Bdynamic" "-lssl" "-lcrypto" "-lgcc_s" "-lutil" "-lrt" "-lpthread" 
"-lm" "-ldl" "-lc" "-Wl,--eh-frame-hdr" "-Wl,-znoexecstack" "-L" 
"/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/lib/rustlib/x86_64-poky-linux-gnu/lib" 
"-o" 
"/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/python3-cryptography-40.0.2/target/x86_64-poky-linux-gnu/release/deps/libcryptography_rust.so" 
"-Wl,--gc-sections" "-shared" "-Wl,-O1" "-nodefaultlibs"
   = note: 
/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/12.2.0/ld: 
/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/python3-cryptography-40.0.2/target/x86_64-poky-linux-gnu/release/build/cryptography-rust-aa00e39a952c07ee/out/lib_openssl.a.a(9bdf47a443b7a07f-_openssl.o): 
warning: relocation against `_Py_NoneStruct' in read-only section `.text'
/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/12.2.0/ld: 
/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/python3-cryptography-40.0.2/target/x86_64-poky-linux-gnu/release/build/cryptography-rust-aa00e39a952c07ee/out/lib_openssl.a.a(9bdf47a443b7a07f-_openssl.o): 
relocation R_X86_64_PC32 against undefined symbol `_Py_NoneStruct' can 
not be used when making a shared object; recompile with -fPIC
/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/12.2.0/ld: 
final link failed: bad value
           collect2: error: ld returned 1 exit status


There are some '-L .../recipe-sysroot-native/usr/lib/rustlib/...' that 
can probably causing this. Don't know if it helps us forward?

/Peter


