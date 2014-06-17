Return-Path: <miroslav.kes@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id CFCAB6FDEB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 20:20:09 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id u56so7650120wes.22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 13:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=1w9nw9FEIKMYXJ2aV9sX8ulSrwvtkjm6Rxz+TWH14iM=;
	b=FC+Eld7PUUxD6xfks+9vlyF6GhX8RdUiPEvUGAa7J5sXWRaZZF8dJ/1pXbRctaU1sY
	x6/cWljYKlyeb2JsUVUeuO5T4Z0dHAoA3mKZtc1UgmxM5isdJl3GPfsLP/jfE5KyuYfM
	MlaPA6ez/Y0goJhB5CObKofNlVhsweZ9zMPXNweTf4CJlEsRpKcv67Acutd/+Ny/Nqxj
	df3xBKiL+40mQ24XoLDQqOlznJlGKcSbR4NUBFVtoiuEA4mtBcwwivE7HeN0ebhKHloL
	OFzF6fTKp65V2nIA141x6vOW4RVo7f3g9/nGdZ49Rm/6NAzsbtAfK+4O1yBT+ZhzCrIY
	FXmg==
X-Received: by 10.180.91.234 with SMTP id ch10mr40035094wib.37.1403036409533; 
	Tue, 17 Jun 2014 13:20:09 -0700 (PDT)
Received: from [192.168.1.100] ([188.175.125.133])
	by mx.google.com with ESMTPSA id
	v15sm24823570wjq.17.2014.06.17.13.20.08 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 17 Jun 2014 13:20:08 -0700 (PDT)
Message-ID: <53A0A2F0.2020701@gmail.com>
Date: Tue, 17 Jun 2014 22:20:00 +0200
From: =?UTF-8?B?TWlyb3NsYXYgS2XFoQ==?= <miroslav.kes@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: OE-core <openembedded-core@lists.openembedded.org>
References: <539B27F0.90109@gmail.com>
	<CAJTo0Lauenh9=Mep+4ZUVPnjf0yJDdaCxbrNcB5vXEmtjn5-iA@mail.gmail.com>
In-Reply-To: <CAJTo0Lauenh9=Mep+4ZUVPnjf0yJDdaCxbrNcB5vXEmtjn5-iA@mail.gmail.com>
Subject: Re: cmake: respect ${S} and ${B} patch problem
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
X-List-Received-Date: Tue, 17 Jun 2014 20:20:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/13/14 18:38, Burton, Ross wrote:
> On 13 June 2014 17:33, Miroslav Keš <miroslav.kes@gmail.com> wrote:
>> +    if [ -z "${OECMAKE_SOURCEPATH}" ]; then
>> +        OECMAKE_SOURCEPATH="${S}"
>>      fi
>>
>>      if [ "${S}" != "${B}" ]; then
>> @@ -84,7 +88,7 @@ cmake_do_configure() {
>>
>>      cmake \
>>        ${OECMAKE_SITEFILE} \
>> -      ${S} \
>> +      ${OECMAKE_SOURCEPATH} \
> A better idiom that's more self-documenting would be to set
> OECMAKE_SOURCEPATH ?= "${S}" at the top-level.
>
> Would it be sensible to give that variable a different name as it
> refers specifically to the location of the cmake file, and not the
> rest of the source?
>
> Ross

Here is the updated patch:

Signed-off-by: Mira Kes <miroslav.kes@gmail.com>

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index c9c15f3..f762792 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -23,6 +23,9 @@ OECMAKE_RPATH ?= ""
 OECMAKE_PERLNATIVE_DIR ??= ""
 OECMAKE_EXTRA_ROOT_PATH ?= ""
 
+# Path to the CMake file to process.
+OECMAKE_SOURCEPATH ?= "${S}"
+
 cmake_do_generate_toolchain_file() {
        cat > ${WORKDIR}/toolchain.cmake <<EOF
 # CMake system name must be something like "Linux".
@@ -65,8 +68,8 @@ EOF
 addtask generate_toolchain_file after do_patch before do_configure
 
 cmake_do_configure() {
-       if [ "${OECMAKE_BUILDPATH}" -o "${OECMAKE_SOURCEPATH}" ]; then
-               bbnote "cmake.bbclass no longer uses OECMAKE_SOURCEPATH and OECMAKE_BUILDPATH.  The default behaviour is now out-of-tree builds with B=WORKDIR/build."
+       if [ "${OECMAKE_BUILDPATH}" ]; then
+               bbnote "cmake.bbclass no longer uses OECMAKE_BUILDPATH.  The default behaviour is now out-of-tree builds with B=WORKDIR/build."
        fi
 
        if [ "${S}" != "${B}" ]; then
@@ -84,7 +87,7 @@ cmake_do_configure() {
 
        cmake \
          ${OECMAKE_SITEFILE} \
-         ${S} \
+         ${OECMAKE_SOURCEPATH} \
          -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
          -DCMAKE_INSTALL_BINDIR:PATH=${bindir} \
          -DCMAKE_INSTALL_SBINDIR:PATH=${sbindir} \



