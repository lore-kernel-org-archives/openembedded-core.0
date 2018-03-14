Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6535278854
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 18:55:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w2EItTBG024166
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 14 Mar 2018 11:55:29 -0700 (PDT)
Received: from [172.25.59.213] (172.25.59.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 14 Mar 2018 11:54:48 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: "Burton, Ross" <ross.burton@intel.com>
References: <1520910506-1642-1-git-send-email-jason.wessel@windriver.com>
	<1520910506-1642-2-git-send-email-jason.wessel@windriver.com>
	<CAJTo0La0oaau5ugOzT=k9fdGQx3PpgsPQxm+KGiGJyU06kwoKg@mail.gmail.com>
	<060154ee-65b6-0c17-0f62-2af30a736456@windriver.com>
Message-ID: <642945d0-8300-34f5-7112-746f735cb573@windriver.com>
Date: Wed, 14 Mar 2018 13:55:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <060154ee-65b6-0c17-0f62-2af30a736456@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] boost: Fix link problems with caffe and Movidius SDK
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
X-List-Received-Date: Wed, 14 Mar 2018 18:55:28 -0000
Content-Type: multipart/alternative;
	boundary="------------077D2A259700B29F75373F4F"
Content-Language: en-GB

--------------077D2A259700B29F75373F4F
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit


I can't seem to find where cmake's python checker magically decides the name of the shared object, but I did find an override, so you can drop the patch.   I had even gone so far as to simply make a zero length file instead of the symlink, and everything still built and run.  It is just some cmake detection which is broken.  The ubuntu/debian systems where this code is heavily tested all provide a link for the libboost_python.so which explains why this never turned up previously.  They don't get the option to pick python2 or python3 for boost, they always get both for now.

The override to build with python boost for cmake and caffe is as follows:

cmake -DBoost_PYTHON_LIBRARY_DEBUG=/usr/lib64/libboost_python3.so \
    -DBoost_PYTHON_LIBRARY_RELEASE=/usr/lib64/libboost_python3.so \
    -DBLAS=Open \
    ..


Cheers,
Jason.


On 03/14/2018 09:55 AM, Jason Wessel wrote:
> Perhaps a bug in the cmake detect which is part of boost, because I am not using python2 for caffe.
>
> I used the path of least resistance because as far as I could tell boost only let you build one or the other and in my case it was the python3 boost api. In the end caffe was working and all the python3 tests with the Movidius SDK pass (which use python3).
>
> Jason.
>
> On 03/14/2018 09:50 AM, Burton, Ross wrote:
>> I thought that boost_python was the py2 binary, and boost_python3 was the py3 one?  Is this not a bug in caffe?
>>
>> On 13 March 2018 at 03:08, Jason Wessel <jason.wessel@windriver.com <mailto:jason.wessel@windriver.com>> wrote:
>>
>>     When using an image built with the Yocto Project which has a compiler
>>     and all the required libraries, projects such as caffe for the
>>     Movidius SDK which use python3 and boost fail to build because they
>>     look for libboost_python.so.  The error that cmake returns doesn't
>>     even point to the fact that this is why the configuration fails.
>>
>>     Example showing the problem with the missing symlink:
>>     ================
>>       git clone https://github.com/weiliu89/caffe.git <https://github.com/weiliu89/caffe.git>
>>       cd caffe
>>       mkdir build
>>       cd build
>>       cmake -DBLAS=Open ..
>>
>>     -- Configuring done
>>     CMake Error at CMakeLists.txt:85 (add_dependencies):
>>       The dependency target "pycaffe" of target "pytest" does not exist.
>>     ================
>>
>>     Conditionally creating the link when building python3 support into
>>     boost is all that is needed.
>>
>>     Signed-off-by: Jason Wessel <jason.wessel@windriver.com <mailto:jason.wessel@windriver.com>>
>>     ---
>>      meta/recipes-support/boost/boost.inc | 3 +++
>>      1 file changed, 3 insertions(+)
>>
>>     diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
>>     index 0461ec6..c53edf7 100644
>>     --- a/meta/recipes-support/boost/boost.inc
>>     +++ b/meta/recipes-support/boost/boost.inc
>>     @@ -195,6 +195,9 @@ do_install() {
>>                     fi
>>             done
>>
>>     +       if [ -e ${D}${libdir}/libboost_python3.so ]; then
>>     +               ln -s libboost_python3.so ${D}${libdir}/libboost_python.so
>>     +       fi
>>      }
>>
>>      BBCLASSEXTEND = "native nativesdk"
>>     --
>>     2.7.4
>>
>>     --
>>     _______________________________________________
>>     Openembedded-core mailing list
>>     Openembedded-core@lists.openembedded.org <mailto:Openembedded-core@lists.openembedded.org>
>>     http://lists.openembedded.org/mailman/listinfo/openembedded-core <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>>
>>
>


--------------077D2A259700B29F75373F4F
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix"><br>
      I can't seem to find where cmake's python checker magically
      decides the name of the shared object, but I did find an override,
      so you can drop the patch.   I had even gone so far as to simply
      make a zero length file instead of the symlink, and everything
      still built and run.  It is just some cmake detection which is
      broken.  The ubuntu/debian systems where this code is heavily
      tested all provide a link for the libboost_python.so which
      explains why this never turned up previously.  They don't get the
      option to pick python2 or python3 for boost, they always get both
      for now.<br>
      <br>
      The override to build with python boost for cmake and caffe is as
      follows:<br>
      <br>
      cmake -DBoost_PYTHON_LIBRARY_DEBUG=/usr/lib64/libboost_python3.so
      \<br>
         -DBoost_PYTHON_LIBRARY_RELEASE=/usr/lib64/libboost_python3.so \<br>
         -DBLAS=Open \<br>
         ..<br>
      <br>
      <br>
      Cheers,<br>
      Jason. <br>
      <br>
      <br>
      On 03/14/2018 09:55 AM, Jason Wessel wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:060154ee-65b6-0c17-0f62-2af30a736456@windriver.com">
      <meta http-equiv="Context-Type" content="text/html; charset=utf-8">
      <div class="moz-cite-prefix">Perhaps a bug in the cmake detect
        which is part of boost, because I am not using python2 for
        caffe.<br>
        <br>
        I used the path of least resistance because as far as I could
        tell boost only let you build one or the other and in my case it
        was the python3 boost api. In the end caffe was working and all
        the python3 tests with the Movidius SDK pass (which use
        python3).<br>
        <br>
        Jason. <br>
        <br>
        On 03/14/2018 09:50 AM, Burton, Ross wrote:<br>
      </div>
      <blockquote type="cite"
cite="mid:CAJTo0La0oaau5ugOzT=k9fdGQx3PpgsPQxm+KGiGJyU06kwoKg@mail.gmail.com">
        <div dir="ltr">I thought that boost_python was the py2 binary,
          and boost_python3 was the py3 one?  Is this not a bug in
          caffe?</div>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 13 March 2018 at 03:08, Jason
            Wessel <span dir="ltr">&lt;<a
                href="mailto:jason.wessel@windriver.com" target="_blank"
                moz-do-not-send="true">jason.wessel@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote">When using an image built
              with the Yocto Project which has a compiler<br>
              and all the required libraries, projects such as caffe for
              the<br>
              Movidius SDK which use python3 and boost fail to build
              because they<br>
              look for libboost_python.so.  The error that cmake returns
              doesn't<br>
              even point to the fact that this is why the configuration
              fails.<br>
              <br>
              Example showing the problem with the missing symlink:<br>
              ================<br>
                git clone <a
                href="https://github.com/weiliu89/caffe.git"
                rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/weiliu89/<wbr>caffe.git</a><br>
                cd caffe<br>
                mkdir build<br>
                cd build<br>
                cmake -DBLAS=Open ..<br>
              <br>
              -- Configuring done<br>
              CMake Error at CMakeLists.txt:85 (add_dependencies):<br>
                The dependency target "pycaffe" of target "pytest" does
              not exist.<br>
              ================<br>
              <br>
              Conditionally creating the link when building python3
              support into<br>
              boost is all that is needed.<br>
              <br>
              Signed-off-by: Jason Wessel &lt;<a
                href="mailto:jason.wessel@windriver.com"
                moz-do-not-send="true">jason.wessel@windriver.com</a>&gt;<br>
              ---<br>
               meta/recipes-support/boost/<wbr>boost.inc | 3 +++<br>
               1 file changed, 3 insertions(+)<br>
              <br>
              diff --git a/meta/recipes-support/boost/<wbr>boost.inc
              b/meta/recipes-support/boost/<wbr>boost.inc<br>
              index 0461ec6..c53edf7 100644<br>
              --- a/meta/recipes-support/boost/<wbr>boost.inc<br>
              +++ b/meta/recipes-support/boost/<wbr>boost.inc<br>
              @@ -195,6 +195,9 @@ do_install() {<br>
                              fi<br>
                      done<br>
              <br>
              +       if [ -e ${D}${libdir}/libboost_<wbr>python3.so ];
              then<br>
              +               ln -s libboost_python3.so
              ${D}${libdir}/libboost_python.<wbr>so<br>
              +       fi<br>
               }<br>
              <br>
               BBCLASSEXTEND = "native nativesdk"<br>
              <span class="HOEnZb">--<br>
                2.7.4<br>
                <br>
                --<br>
                ______________________________<wbr>_________________<br>
                Openembedded-core mailing list<br>
                <a
                  href="mailto:Openembedded-core@lists.openembedded.org"
                  moz-do-not-send="true">Openembedded-core@lists.<wbr>openembedded.org</a><br>
                <a
                  href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                  rel="noreferrer" target="_blank"
                  moz-do-not-send="true">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
              </span></blockquote>
          </div>
          <br>
        </div>
      </blockquote>
      <p><br>
      </p>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------077D2A259700B29F75373F4F--
