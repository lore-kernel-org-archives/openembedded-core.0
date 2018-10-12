Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EBC8F79B8E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 09:26:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9C9Q3KI017610
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 12 Oct 2018 02:26:03 -0700 (PDT)
Received: from [128.224.162.232] (128.224.162.232) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 12 Oct 2018 02:26:02 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <20181011095511.5509-1-hongxu.jia@windriver.com>
	<e8b42506cdaf9437f715100f0ff6541d5ed3c894.camel@linuxfoundation.org>
	<8fe4eb7c-a838-e1da-a1a2-7acd201d9977@windriver.com>
	<3012dac0-ec3a-bfd8-fb58-27be91642b4d@windriver.com>
	<62308c8aac0596271b7ca1f12aabb78547f1a7a9.camel@linuxfoundation.org>
	<d79efe64-c2a1-fb09-d174-7d27ab741442@windriver.com>
Message-ID: <c1f23152-78db-f42d-becc-435cd777fee4@windriver.com>
Date: Fri, 12 Oct 2018 17:26:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <d79efe64-c2a1-fb09-d174-7d27ab741442@windriver.com>
Subject: Re: [PATCH] openssl: use nativeperl to build
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
X-List-Received-Date: Fri, 12 Oct 2018 09:26:04 -0000
Content-Type: multipart/alternative;
	boundary="------------FF87A6C72B4F35CB78EFBA0E"
Content-Language: en-US

--------------FF87A6C72B4F35CB78EFBA0E
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2018年10月12日 17:03, Hongxu Jia wrote:
>> https://github.com/openssl/openssl/commit/4e351ca92e3a1f447cef3d2e330f13941f9412c6
>>
>> That is a good find. Perhaps we could check for that in sanity.bbclass?
>> Is it commonly available in distributions like centos?
> I am afraid the perl module (Text::Template) is not common,
> available on most distro, since they do not need to build
> openssl :(
>
> But I am curious that without that perl module, the build seem
> ok with newer perl (perl v5.22.1 in ubuntu 1804 and without 
> Text::Template)
>
> I am going on digging the root cause why the build works well
> without the perl module
>

I know the reason

It will try to use Text::Template, if failed it fallback to load the old 
one in perl source

[snip util/dofile.pl]
use with_fallback "Text::Template 1.46";
[snip util/dofile.pl]

[snip util/perl/with_fallback.pm]
sub import {
     shift;

     use File::Basename;
     use File::Spec::Functions;
     foreach (@_) {
         eval "use $_";
         if ($@) {
             unshift @INC, catdir(dirname(__FILE__),
                                  "..", "..", "external", "perl");
             my $transfer = "transfer::$_";
             eval "use $transfer";
             shift @INC;
             warn $@ if $@;
         }
     }
}
[snip util/perl/with_fallback.pm]

https://github.com/openssl/openssl/commit/8ff2af548303d311ce3591406111f77862875a60
[comments]
Bundle the non core Perl module Text::Template

Because we're using Text::Template and we know it's a non core Perl
module, we choose to bundle it into our source, for convenience.

external/perl/Downloaded.txt document what modules we choose to bundle
this way and exactly where we downloaded it from.

With this changes comes the transfer module for with_fallback.

Reviewed-by: Rich Salz <rsalz@openssl.org>
[comments]

//Hongxu

> //Hongxu



--------------FF87A6C72B4F35CB78EFBA0E
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2018年10月12日 17:03, Hongxu Jia wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:d79efe64-c2a1-fb09-d174-7d27ab741442@windriver.com">
      <blockquote type="cite"
cite="mid:62308c8aac0596271b7ca1f12aabb78547f1a7a9.camel@linuxfoundation.org">
        <blockquote type="cite" style="color: #000000;"> </blockquote>
        <pre wrap=""><a class="moz-txt-link-freetext" href="https://github.com/openssl/openssl/commit/4e351ca92e3a1f447cef3d2e330f13941f9412c6" moz-do-not-send="true">https://github.com/openssl/openssl/commit/4e351ca92e3a1f447cef3d2e330f13941f9412c6</a>

That is a good find. Perhaps we could check for that in sanity.bbclass?
Is it commonly available in distributions like centos? 
</pre>
      </blockquote>
      I am afraid the perl module (Text::Template) is not common,<br>
      available on most distro, since they do not need to build<br>
      openssl :(<br>
      <br>
      But I am curious that without that perl module, the build seem<br>
      ok with newer perl (perl v5.22.1 in ubuntu 1804 and without
      Text::Template)<br>
      <br>
      I am going on digging the root cause why the build works well<br>
      without the perl module<br>
      <br>
    </blockquote>
    <br>
    I know the reason<br>
    <br>
    It will try to use Text::Template, if failed it fallback to load the
    old one in perl source<br>
    <br>
    [snip util/dofile.pl]<br>
    use with_fallback "Text::Template 1.46";<br>
    [snip util/dofile.pl]<br>
    <br>
    [snip util/perl/with_fallback.pm]<br>
    sub import {<br>
        shift;<br>
    <br>
        use File::Basename;<br>
        use File::Spec::Functions;<br>
        foreach (@_) {<br>
            eval "use $_";<br>
            if ($@) {<br>
                unshift @INC, catdir(dirname(__FILE__),<br>
                                     "..", "..", "external", "perl");<br>
                my $transfer = "transfer::$_";<br>
                eval "use $transfer";<br>
                shift @INC;<br>
                warn $@ if $@;<br>
            }<br>
        }<br>
    }<br>
    [snip util/perl/with_fallback.pm]<br>
    <br>
<a class="moz-txt-link-freetext" href="https://github.com/openssl/openssl/commit/8ff2af548303d311ce3591406111f77862875a60">https://github.com/openssl/openssl/commit/8ff2af548303d311ce3591406111f77862875a60</a><br>
    [comments]<br>
    Bundle the non core Perl module Text::Template<br>
    <br>
    Because we're using Text::Template and we know it's a non core Perl<br>
    module, we choose to bundle it into our source, for convenience.<br>
    <br>
    external/perl/Downloaded.txt document what modules we choose to
    bundle<br>
    this way and exactly where we downloaded it from.<br>
    <br>
    With this changes comes the transfer module for with_fallback.<br>
    <br>
    Reviewed-by: Rich Salz <a class="moz-txt-link-rfc2396E" href="mailto:rsalz@openssl.org">&lt;rsalz@openssl.org&gt;</a><br>
    [comments]<br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote type="cite"
      cite="mid:d79efe64-c2a1-fb09-d174-7d27ab741442@windriver.com">
      //Hongxu</blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------FF87A6C72B4F35CB78EFBA0E--
