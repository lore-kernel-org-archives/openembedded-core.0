Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1TB1bt-0007mq-6P
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 12:52:58 +0200
Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 10 Sep 2012 03:40:19 -0700
Received: by qadc11 with SMTP id c11so1112337qad.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2012 03:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=D/EQi/+CdKtYGgcUAC/uLdkpIEfdn5bnG6SHdLHZiGg=;
	b=Lbhr0o1EzAUxvBnJT7TB77646U9CcaKu7Qna9IiTDRmaao3uWsDo7qqmk2tpRkPtcr
	F+tNS4ZM0zJEzfiidUSSEfuRQQyP7AvIxq7T3ofTKzmdzI347nhkwfCgMFIUq1IY90Bw
	RmKtKyGmmf7DvqNXd4NI0Cz0QJLZOGjMopK4qezSMPux4FrKs6DLTBOaX/4OpNls9gEr
	Qegw1Af48yl1zo6fctH9Nu7V5tuqdfJMu3RiOubqtzYtEN3rckP+5t79/Hbe19wRwy0B
	YCy/QbFtyH1cR0qNXkaNRCJZ042WcFNoHFD8Il9R2cr59Yjxp/PLMEZTI9q3IUT4CxmY
	cQmg==
Received: by 10.229.106.36 with SMTP id v36mr3836452qco.92.1347273625657; Mon,
	10 Sep 2012 03:40:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.49.74.74 with HTTP; Mon, 10 Sep 2012 03:40:05 -0700 (PDT)
In-Reply-To: <1347273698-26576-1-git-send-email-bogdan.a.marinescu@intel.com>
References: <1347273698-26576-1-git-send-email-bogdan.a.marinescu@intel.com>
From: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Mon, 10 Sep 2012 13:40:05 +0300
Message-ID: <CAMZjud1LxPr7-3aXKpgTyXxZXdmcXA28mLt=7V-J3HbMi8JoPA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQkUaeRZTMiJyMr8CbiNujt3YmopfYgaZKCTrBe8qya0mPwmqeVAYrjU9qO6DawEGYzKl6Pl
Subject: Re: [PATCH] [for-denzil] Save proxy settings
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
X-List-Received-Date: Mon, 10 Sep 2012 10:52:58 -0000
Content-Type: multipart/alternative; boundary=00235429dc70df606b04c956954e

--00235429dc70df606b04c956954e
Content-Type: text/plain; charset=ISO-8859-1

Sorry, wrong list. Please disregard this.

On Mon, Sep 10, 2012 at 1:41 PM, Bogdan Marinescu <
bogdan.a.marinescu@intel.com> wrote:

> Proxy settings were not properly saved between Hob runs. This
> fix is mostly a backport of code in master.
>
> [YOCTO #3024]
>
> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> ---
>  bitbake/lib/bb/ui/crumbs/builder.py |   18 ++++++++---
>  bitbake/lib/bb/ui/crumbs/hig.py     |   58
> +++++++++++++++++------------------
>  2 files changed, 43 insertions(+), 33 deletions(-)
>
> diff --git a/bitbake/lib/bb/ui/crumbs/builder.py
> b/bitbake/lib/bb/ui/crumbs/builder.py
> index df85326..000a838 100755
> --- a/bitbake/lib/bb/ui/crumbs/builder.py
> +++ b/bitbake/lib/bb/ui/crumbs/builder.py
> @@ -70,6 +70,7 @@ class Configuration:
>          self.all_proxy = self.http_proxy = self.ftp_proxy =
> self.https_proxy = ""
>          self.git_proxy_host = self.git_proxy_port = ""
>          self.cvs_proxy_host = self.cvs_proxy_port = ""
> +        self.enable_proxy = None
>
>      def clear_selection(self):
>          self.selected_image = None
> @@ -99,6 +100,9 @@ class Configuration:
>          self.default_task = params["default_task"]
>
>          # proxy settings
> +        self.enable_proxy = params["http_proxy"] != "" or
> params["https_proxy"] != "" or params["ftp_proxy"] != "" \
> +            or params["git_proxy_host"] != "" or params["git_proxy_port"]
> != ""                                    \
> +            or params["cvs_proxy_host"] != "" or params["cvs_proxy_port"]
> != "" or params["all_proxy"] != ""
>          self.all_proxy = params["all_proxy"]
>          self.http_proxy = params["http_proxy"]
>          self.ftp_proxy = params["ftp_proxy"]
> @@ -146,6 +150,7 @@ class Configuration:
>          self.selected_recipes = template.getVar("DEPENDS").split()
>          self.selected_packages = template.getVar("IMAGE_INSTALL").split()
>          # proxy
> +        self.enable_proxy = eval(template.getVar("enable_proxy"))
>          self.all_proxy = template.getVar("all_proxy")
>          self.http_proxy = template.getVar("http_proxy")
>          self.ftp_proxy = template.getVar("ftp_proxy")
> @@ -183,6 +188,7 @@ class Configuration:
>              template.setVar("DEPENDS", self.selected_recipes)
>              template.setVar("IMAGE_INSTALL", self.user_selected_packages)
>          # proxy
> +        template.setVar("enable_proxy", self.enable_proxy)
>          template.setVar("all_proxy", self.all_proxy)
>          template.setVar("http_proxy", self.http_proxy)
>          template.setVar("ftp_proxy", self.ftp_proxy)
> @@ -212,7 +218,6 @@ class Parameters:
>          self.all_sdk_machines = []
>          self.all_layers = []
>          self.image_names = []
> -        self.enable_proxy = False
>
>          # for build log to show
>          self.bb_version = ""
> @@ -581,13 +586,20 @@ class Builder(gtk.Window):
>          self.handler.set_extra_inherit("packageinfo")
>          self.handler.set_extra_inherit("image_types")
>          # set proxies
> -        if self.parameters.enable_proxy:
> +        if self.configuration.enable_proxy == True:
>              self.handler.set_http_proxy(self.configuration.http_proxy)
>              self.handler.set_https_proxy(self.configuration.https_proxy)
>              self.handler.set_ftp_proxy(self.configuration.ftp_proxy)
>              self.handler.set_all_proxy(self.configuration.all_proxy)
>              self.handler.set_git_proxy(self.configuration.git_proxy_host,
> self.configuration.git_proxy_port)
>              self.handler.set_cvs_proxy(self.configuration.cvs_proxy_host,
> self.configuration.cvs_proxy_port)
> +        elif self.configuration.enable_proxy == False:
> +            self.handler.set_http_proxy('')
> +            self.handler.set_https_proxy('')
> +            self.handler.set_ftp_proxy('')
> +            self.handler.set_all_proxy('')
> +            self.handler.set_git_proxy('', '')
> +            self.handler.set_cvs_proxy('', '')
>
>      def update_recipe_model(self, selected_image, selected_recipes):
>          self.recipe_model.set_selected_image(selected_image)
> @@ -1009,7 +1021,6 @@ class Builder(gtk.Window):
>              all_distros = self.parameters.all_distros,
>              all_sdk_machines = self.parameters.all_sdk_machines,
>              max_threads = self.parameters.max_threads,
> -            enable_proxy = self.parameters.enable_proxy,
>              parent = self,
>              flags = gtk.DIALOG_MODAL
>                      | gtk.DIALOG_DESTROY_WITH_PARENT
> @@ -1021,7 +1032,6 @@ class Builder(gtk.Window):
>          response = dialog.run()
>          settings_changed = False
>          if response == gtk.RESPONSE_YES:
> -            self.parameters.enable_proxy = dialog.enable_proxy
>              self.configuration = dialog.configuration
>              self.save_defaults() # remember settings
>              settings_changed = dialog.settings_changed
> diff --git a/bitbake/lib/bb/ui/crumbs/hig.py
> b/bitbake/lib/bb/ui/crumbs/hig.py
> index 4baf960..b6c970b 100644
> --- a/bitbake/lib/bb/ui/crumbs/hig.py
> +++ b/bitbake/lib/bb/ui/crumbs/hig.py
> @@ -309,7 +309,7 @@ class AdvancedSettingDialog (CrumbsDialog):
>
>      def __init__(self, title, configuration, all_image_types,
>              all_package_formats, all_distros, all_sdk_machines,
> -            max_threads, enable_proxy, parent, flags, buttons=None):
> +            max_threads, parent, flags, buttons=None):
>          super(AdvancedSettingDialog, self).__init__(title, parent, flags,
> buttons)
>
>          # class members from other objects
> @@ -320,7 +320,6 @@ class AdvancedSettingDialog (CrumbsDialog):
>          self.all_distros = all_distros
>          self.all_sdk_machines = all_sdk_machines
>          self.max_threads = max_threads
> -        self.enable_proxy = enable_proxy
>
>          # class members for internal use
>          self.distro_combo = None
> @@ -356,7 +355,8 @@ class AdvancedSettingDialog (CrumbsDialog):
>          data += ("SDK_MACHINE: "          +
> self._get_sorted_value(self.configuration.curr_sdk_machine))
>          data += ("TOOLCHAIN_BUILD: "      +
> self._get_sorted_value(self.configuration.toolchain_build))
>          data += ("IMAGE_FSTYPES: "        +
> self._get_sorted_value(self.configuration.image_fstypes))
> -        if self.enable_proxy:
> +        data += ("ENABLE_PROXY: "         +
> self._get_sorted_value(self.configuration.enable_proxy))
> +        if self.configuration.enable_proxy:
>              data += ("ALL_PROXY: "            +
> self._get_sorted_value(self.configuration.all_proxy))
>              data += ("HTTP_PROXY: "           +
> self._get_sorted_value(self.configuration.http_proxy))
>              data += ("HTTPS_PROXY: "          +
> self._get_sorted_value(self.configuration.https_proxy))
> @@ -531,55 +531,55 @@ class AdvancedSettingDialog (CrumbsDialog):
>          advanced_vbox.pack_start(sub_vbox, expand=False, fill=False)
>          self.proxy_checkbox = gtk.CheckButton("Enable proxy")
>          self.proxy_checkbox.set_tooltip_text("Check this box to setup the
> proxy you specified")
> -        self.proxy_checkbox.set_active(self.enable_proxy)
> +        self.proxy_checkbox.set_active(self.configuration.enable_proxy)
>          self.proxy_checkbox.connect("toggled",
> self.proxy_checkbox_toggled_cb)
>          sub_vbox.pack_start(self.proxy_checkbox, expand=False, fill=False)
>
>          label = self.gen_label_widget("<span weight=\"bold\">Set all
> proxy:</span>")
>          tooltip = "Set the all proxy that will be used if the proxy for a
> URL isn't specified."
>          proxy_widget, self.all_proxy_text =
> self.gen_entry_widget(self.configuration.all_proxy, self, tooltip, False)
> -        self.all_proxy_text.set_editable(self.enable_proxy)
> -        self.all_proxy_text.set_sensitive(self.enable_proxy)
> +        self.all_proxy_text.set_editable(self.configuration.enable_proxy)
> +        self.all_proxy_text.set_sensitive(self.configuration.enable_proxy)
>          sub_vbox.pack_start(label, expand=False, fill=False)
>          sub_vbox.pack_start(proxy_widget, expand=False, fill=False)
>
>          label = self.gen_label_widget("<span weight=\"bold\">Set http
> proxy:</span>")
>          tooltip = "Set the http proxy that will be used in do_fetch()
> source code"
>          proxy_widget, self.http_proxy_text =
> self.gen_entry_widget(self.configuration.http_proxy, self, tooltip, False)
> -        self.http_proxy_text.set_editable(self.enable_proxy)
> -        self.http_proxy_text.set_sensitive(self.enable_proxy)
> +        self.http_proxy_text.set_editable(self.configuration.enable_proxy)
> +
>  self.http_proxy_text.set_sensitive(self.configuration.enable_proxy)
>          sub_vbox.pack_start(label, expand=False, fill=False)
>          sub_vbox.pack_start(proxy_widget, expand=False, fill=False)
>
>          label = self.gen_label_widget("<span weight=\"bold\">Set https
> proxy:</span>")
>          tooltip = "Set the https proxy that will be used in do_fetch()
> source code"
>          proxy_widget, self.https_proxy_text =
> self.gen_entry_widget(self.configuration.https_proxy, self, tooltip, False)
> -        self.https_proxy_text.set_editable(self.enable_proxy)
> -        self.https_proxy_text.set_sensitive(self.enable_proxy)
> +
>  self.https_proxy_text.set_editable(self.configuration.enable_proxy)
> +
>  self.https_proxy_text.set_sensitive(self.configuration.enable_proxy)
>          sub_vbox.pack_start(label, expand=False, fill=False)
>          sub_vbox.pack_start(proxy_widget, expand=False, fill=False)
>
>          label = self.gen_label_widget("<span weight=\"bold\">Set ftp
> proxy:</span>")
>          tooltip = "Set the ftp proxy that will be used in do_fetch()
> source code"
>          proxy_widget, self.ftp_proxy_text =
> self.gen_entry_widget(self.configuration.ftp_proxy, self, tooltip, False)
> -        self.ftp_proxy_text.set_editable(self.enable_proxy)
> -        self.ftp_proxy_text.set_sensitive(self.enable_proxy)
> +        self.ftp_proxy_text.set_editable(self.configuration.enable_proxy)
> +        self.ftp_proxy_text.set_sensitive(self.configuration.enable_proxy)
>          sub_vbox.pack_start(label, expand=False, fill=False)
>          sub_vbox.pack_start(proxy_widget, expand=False, fill=False)
>
>          label = self.gen_label_widget("<span weight=\"bold\">Set git
> proxy:</span>")
>          tooltip = "Set the git proxy that will be used in do_fetch()
> source code"
>          proxy_widget, self.git_proxy_text =
> self.gen_entry_widget(self.configuration.git_proxy_host + ':' +
> self.configuration.git_proxy_port, self, tooltip, False)
> -        self.git_proxy_text.set_editable(self.enable_proxy)
> -        self.git_proxy_text.set_sensitive(self.enable_proxy)
> +        self.git_proxy_text.set_editable(self.configuration.enable_proxy)
> +        self.git_proxy_text.set_sensitive(self.configuration.enable_proxy)
>          sub_vbox.pack_start(label, expand=False, fill=False)
>          sub_vbox.pack_start(proxy_widget, expand=False, fill=False)
>
>          label = self.gen_label_widget("<span weight=\"bold\">Set cvs
> proxy:</span>")
>          tooltip = "Set the cvs proxy that will be used in do_fetch()
> source code"
>          proxy_widget, self.cvs_proxy_text =
> self.gen_entry_widget(self.configuration.cvs_proxy_host + ':' +
> self.configuration.cvs_proxy_port, self, tooltip, False)
> -        self.cvs_proxy_text.set_editable(self.enable_proxy)
> -        self.cvs_proxy_text.set_sensitive(self.enable_proxy)
> +        self.cvs_proxy_text.set_editable(self.configuration.enable_proxy)
> +        self.cvs_proxy_text.set_sensitive(self.configuration.enable_proxy)
>          sub_vbox.pack_start(label, expand=False, fill=False)
>          sub_vbox.pack_start(proxy_widget, expand=False, fill=False)
>
> @@ -600,19 +600,19 @@ class AdvancedSettingDialog (CrumbsDialog):
>          return advanced_vbox
>
>      def proxy_checkbox_toggled_cb(self, button):
> -        self.enable_proxy = self.proxy_checkbox.get_active()
> -        self.all_proxy_text.set_editable(self.enable_proxy)
> -        self.all_proxy_text.set_sensitive(self.enable_proxy)
> -        self.http_proxy_text.set_editable(self.enable_proxy)
> -        self.http_proxy_text.set_sensitive(self.enable_proxy)
> -        self.https_proxy_text.set_editable(self.enable_proxy)
> -        self.https_proxy_text.set_sensitive(self.enable_proxy)
> -        self.ftp_proxy_text.set_editable(self.enable_proxy)
> -        self.ftp_proxy_text.set_sensitive(self.enable_proxy)
> -        self.git_proxy_text.set_editable(self.enable_proxy)
> -        self.git_proxy_text.set_sensitive(self.enable_proxy)
> -        self.cvs_proxy_text.set_editable(self.enable_proxy)
> -        self.cvs_proxy_text.set_sensitive(self.enable_proxy)
> +        self.configuration.enable_proxy = self.proxy_checkbox.get_active()
> +        self.all_proxy_text.set_editable(self.configuration.enable_proxy)
> +        self.all_proxy_text.set_sensitive(self.configuration.enable_proxy)
> +        self.http_proxy_text.set_editable(self.configuration.enable_proxy)
> +
>  self.http_proxy_text.set_sensitive(self.configuration.enable_proxy)
> +
>  self.https_proxy_text.set_editable(self.configuration.enable_proxy)
> +
>  self.https_proxy_text.set_sensitive(self.configuration.enable_proxy)
> +        self.ftp_proxy_text.set_editable(self.configuration.enable_proxy)
> +        self.ftp_proxy_text.set_sensitive(self.configuration.enable_proxy)
> +        self.git_proxy_text.set_editable(self.configuration.enable_proxy)
> +        self.git_proxy_text.set_sensitive(self.configuration.enable_proxy)
> +        self.cvs_proxy_text.set_editable(self.configuration.enable_proxy)
> +        self.cvs_proxy_text.set_sensitive(self.configuration.enable_proxy)
>
>      def response_cb(self, dialog, response_id):
>          package_format = []
> --
> 1.7.9.5
>
>

--00235429dc70df606b04c956954e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Sorry, wrong list. Please disregard this.<br><br><div class=3D"gmail_quote"=
>On Mon, Sep 10, 2012 at 1:41 PM, Bogdan Marinescu <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:bogdan.a.marinescu@intel.com" target=3D"_blank">bogdan.a.ma=
rinescu@intel.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Proxy settings were not properly saved betwe=
en Hob runs. This<br>
fix is mostly a backport of code in master.<br>
<br>
[YOCTO #3024]<br>
<br>
Signed-off-by: Bogdan Marinescu &lt;<a href=3D"mailto:bogdan.a.marinescu@in=
tel.com">bogdan.a.marinescu@intel.com</a>&gt;<br>
---<br>
=A0bitbake/lib/bb/ui/crumbs/builder.py | =A0 18 ++++++++---<br>
=A0bitbake/lib/bb/ui/crumbs/hig.py =A0 =A0 | =A0 58 +++++++++++++++++------=
------------<br>
=A02 files changed, 43 insertions(+), 33 deletions(-)<br>
<br>
diff --git a/bitbake/lib/bb/ui/crumbs/builder.py b/bitbake/lib/bb/ui/crumbs=
/builder.py<br>
index df85326..000a838 100755<br>
--- a/bitbake/lib/bb/ui/crumbs/builder.py<br>
+++ b/bitbake/lib/bb/ui/crumbs/builder.py<br>
@@ -70,6 +70,7 @@ class Configuration:<br>
=A0 =A0 =A0 =A0 =A0self.all_proxy =3D self.http_proxy =3D self.ftp_proxy =
=3D self.https_proxy =3D &quot;&quot;<br>
=A0 =A0 =A0 =A0 =A0self.git_proxy_host =3D self.git_proxy_port =3D &quot;&q=
uot;<br>
=A0 =A0 =A0 =A0 =A0self.cvs_proxy_host =3D self.cvs_proxy_port =3D &quot;&q=
uot;<br>
+ =A0 =A0 =A0 =A0self.enable_proxy =3D None<br>
<br>
=A0 =A0 =A0def clear_selection(self):<br>
=A0 =A0 =A0 =A0 =A0self.selected_image =3D None<br>
@@ -99,6 +100,9 @@ class Configuration:<br>
=A0 =A0 =A0 =A0 =A0self.default_task =3D params[&quot;default_task&quot;]<b=
r>
<br>
=A0 =A0 =A0 =A0 =A0# proxy settings<br>
+ =A0 =A0 =A0 =A0self.enable_proxy =3D params[&quot;http_proxy&quot;] !=3D =
&quot;&quot; or params[&quot;https_proxy&quot;] !=3D &quot;&quot; or params=
[&quot;ftp_proxy&quot;] !=3D &quot;&quot; \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0or params[&quot;git_proxy_host&quot;] !=3D &quot;&=
quot; or params[&quot;git_proxy_port&quot;] !=3D &quot;&quot; =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\<br>
+ =A0 =A0 =A0 =A0 =A0 =A0or params[&quot;cvs_proxy_host&quot;] !=3D &quot;&=
quot; or params[&quot;cvs_proxy_port&quot;] !=3D &quot;&quot; or params[&qu=
ot;all_proxy&quot;] !=3D &quot;&quot;<br>
=A0 =A0 =A0 =A0 =A0self.all_proxy =3D params[&quot;all_proxy&quot;]<br>
=A0 =A0 =A0 =A0 =A0self.http_proxy =3D params[&quot;http_proxy&quot;]<br>
=A0 =A0 =A0 =A0 =A0self.ftp_proxy =3D params[&quot;ftp_proxy&quot;]<br>
@@ -146,6 +150,7 @@ class Configuration:<br>
=A0 =A0 =A0 =A0 =A0self.selected_recipes =3D template.getVar(&quot;DEPENDS&=
quot;).split()<br>
=A0 =A0 =A0 =A0 =A0self.selected_packages =3D template.getVar(&quot;IMAGE_I=
NSTALL&quot;).split()<br>
=A0 =A0 =A0 =A0 =A0# proxy<br>
+ =A0 =A0 =A0 =A0self.enable_proxy =3D eval(template.getVar(&quot;enable_pr=
oxy&quot;))<br>
=A0 =A0 =A0 =A0 =A0self.all_proxy =3D template.getVar(&quot;all_proxy&quot;=
)<br>
=A0 =A0 =A0 =A0 =A0self.http_proxy =3D template.getVar(&quot;http_proxy&quo=
t;)<br>
=A0 =A0 =A0 =A0 =A0self.ftp_proxy =3D template.getVar(&quot;ftp_proxy&quot;=
)<br>
@@ -183,6 +188,7 @@ class Configuration:<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0template.setVar(&quot;DEPENDS&quot;, self.select=
ed_recipes)<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0template.setVar(&quot;IMAGE_INSTALL&quot;, self.=
user_selected_packages)<br>
=A0 =A0 =A0 =A0 =A0# proxy<br>
+ =A0 =A0 =A0 =A0template.setVar(&quot;enable_proxy&quot;, self.enable_prox=
y)<br>
=A0 =A0 =A0 =A0 =A0template.setVar(&quot;all_proxy&quot;, self.all_proxy)<b=
r>
=A0 =A0 =A0 =A0 =A0template.setVar(&quot;http_proxy&quot;, self.http_proxy)=
<br>
=A0 =A0 =A0 =A0 =A0template.setVar(&quot;ftp_proxy&quot;, self.ftp_proxy)<b=
r>
@@ -212,7 +218,6 @@ class Parameters:<br>
=A0 =A0 =A0 =A0 =A0self.all_sdk_machines =3D []<br>
=A0 =A0 =A0 =A0 =A0self.all_layers =3D []<br>
=A0 =A0 =A0 =A0 =A0self.image_names =3D []<br>
- =A0 =A0 =A0 =A0self.enable_proxy =3D False<br>
<br>
=A0 =A0 =A0 =A0 =A0# for build log to show<br>
=A0 =A0 =A0 =A0 =A0self.bb_version =3D &quot;&quot;<br>
@@ -581,13 +586,20 @@ class Builder(gtk.Window):<br>
=A0 =A0 =A0 =A0 =A0self.handler.set_extra_inherit(&quot;packageinfo&quot;)<=
br>
=A0 =A0 =A0 =A0 =A0self.handler.set_extra_inherit(&quot;image_types&quot;)<=
br>
=A0 =A0 =A0 =A0 =A0# set proxies<br>
- =A0 =A0 =A0 =A0if self.parameters.enable_proxy:<br>
+ =A0 =A0 =A0 =A0if self.configuration.enable_proxy =3D=3D True:<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0self.handler.set_http_proxy(self.configuration.h=
ttp_proxy)<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0self.handler.set_https_proxy(self.configuration.=
https_proxy)<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0self.handler.set_ftp_proxy(self.configuration.ft=
p_proxy)<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0self.handler.set_all_proxy(self.configuration.al=
l_proxy)<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0self.handler.set_git_proxy(self.configuration.gi=
t_proxy_host, self.configuration.git_proxy_port)<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0self.handler.set_cvs_proxy(self.configuration.cv=
s_proxy_host, self.configuration.cvs_proxy_port)<br>
+ =A0 =A0 =A0 =A0elif self.configuration.enable_proxy =3D=3D False:<br>
+ =A0 =A0 =A0 =A0 =A0 =A0self.handler.set_http_proxy(&#39;&#39;)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0self.handler.set_https_proxy(&#39;&#39;)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0self.handler.set_ftp_proxy(&#39;&#39;)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0self.handler.set_all_proxy(&#39;&#39;)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0self.handler.set_git_proxy(&#39;&#39;, &#39;&#39;)=
<br>
+ =A0 =A0 =A0 =A0 =A0 =A0self.handler.set_cvs_proxy(&#39;&#39;, &#39;&#39;)=
<br>
<br>
=A0 =A0 =A0def update_recipe_model(self, selected_image, selected_recipes):=
<br>
=A0 =A0 =A0 =A0 =A0self.recipe_model.set_selected_image(selected_image)<br>
@@ -1009,7 +1021,6 @@ class Builder(gtk.Window):<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0all_distros =3D self.parameters.all_distros,<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0all_sdk_machines =3D self.parameters.all_sdk_mac=
hines,<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0max_threads =3D self.parameters.max_threads,<br>
- =A0 =A0 =A0 =A0 =A0 =A0enable_proxy =3D self.parameters.enable_proxy,<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0parent =3D self,<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0flags =3D gtk.DIALOG_MODAL<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| gtk.DIALOG_DESTROY_WITH_PARENT=
<br>
@@ -1021,7 +1032,6 @@ class Builder(gtk.Window):<br>
=A0 =A0 =A0 =A0 =A0response =3D dialog.run()<br>
=A0 =A0 =A0 =A0 =A0settings_changed =3D False<br>
=A0 =A0 =A0 =A0 =A0if response =3D=3D gtk.RESPONSE_YES:<br>
- =A0 =A0 =A0 =A0 =A0 =A0self.parameters.enable_proxy =3D dialog.enable_pro=
xy<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0self.configuration =3D dialog.configuration<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0self.save_defaults() # remember settings<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0settings_changed =3D dialog.settings_changed<br>
diff --git a/bitbake/lib/bb/ui/crumbs/hig.py b/bitbake/lib/bb/ui/crumbs/hig=
.py<br>
index 4baf960..b6c970b 100644<br>
--- a/bitbake/lib/bb/ui/crumbs/hig.py<br>
+++ b/bitbake/lib/bb/ui/crumbs/hig.py<br>
@@ -309,7 +309,7 @@ class AdvancedSettingDialog (CrumbsDialog):<br>
<br>
=A0 =A0 =A0def __init__(self, title, configuration, all_image_types,<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0all_package_formats, all_distros, all_sdk_machin=
es,<br>
- =A0 =A0 =A0 =A0 =A0 =A0max_threads, enable_proxy, parent, flags, buttons=
=3DNone):<br>
+ =A0 =A0 =A0 =A0 =A0 =A0max_threads, parent, flags, buttons=3DNone):<br>
=A0 =A0 =A0 =A0 =A0super(AdvancedSettingDialog, self).__init__(title, paren=
t, flags, buttons)<br>
<br>
=A0 =A0 =A0 =A0 =A0# class members from other objects<br>
@@ -320,7 +320,6 @@ class AdvancedSettingDialog (CrumbsDialog):<br>
=A0 =A0 =A0 =A0 =A0self.all_distros =3D all_distros<br>
=A0 =A0 =A0 =A0 =A0self.all_sdk_machines =3D all_sdk_machines<br>
=A0 =A0 =A0 =A0 =A0self.max_threads =3D max_threads<br>
- =A0 =A0 =A0 =A0self.enable_proxy =3D enable_proxy<br>
<br>
=A0 =A0 =A0 =A0 =A0# class members for internal use<br>
=A0 =A0 =A0 =A0 =A0self.distro_combo =3D None<br>
@@ -356,7 +355,8 @@ class AdvancedSettingDialog (CrumbsDialog):<br>
=A0 =A0 =A0 =A0 =A0data +=3D (&quot;SDK_MACHINE: &quot; =A0 =A0 =A0 =A0 =A0=
+ self._get_sorted_value(self.configuration.curr_sdk_machine))<br>
=A0 =A0 =A0 =A0 =A0data +=3D (&quot;TOOLCHAIN_BUILD: &quot; =A0 =A0 =A0+ se=
lf._get_sorted_value(self.configuration.toolchain_build))<br>
=A0 =A0 =A0 =A0 =A0data +=3D (&quot;IMAGE_FSTYPES: &quot; =A0 =A0 =A0 =A0+ =
self._get_sorted_value(self.configuration.image_fstypes))<br>
- =A0 =A0 =A0 =A0if self.enable_proxy:<br>
+ =A0 =A0 =A0 =A0data +=3D (&quot;ENABLE_PROXY: &quot; =A0 =A0 =A0 =A0 + se=
lf._get_sorted_value(self.configuration.enable_proxy))<br>
+ =A0 =A0 =A0 =A0if self.configuration.enable_proxy:<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0data +=3D (&quot;ALL_PROXY: &quot; =A0 =A0 =A0 =
=A0 =A0 =A0+ self._get_sorted_value(self.configuration.all_proxy))<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0data +=3D (&quot;HTTP_PROXY: &quot; =A0 =A0 =A0 =
=A0 =A0 + self._get_sorted_value(self.configuration.http_proxy))<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0data +=3D (&quot;HTTPS_PROXY: &quot; =A0 =A0 =A0=
 =A0 =A0+ self._get_sorted_value(self.configuration.https_proxy))<br>
@@ -531,55 +531,55 @@ class AdvancedSettingDialog (CrumbsDialog):<br>
=A0 =A0 =A0 =A0 =A0advanced_vbox.pack_start(sub_vbox, expand=3DFalse, fill=
=3DFalse)<br>
=A0 =A0 =A0 =A0 =A0self.proxy_checkbox =3D gtk.CheckButton(&quot;Enable pro=
xy&quot;)<br>
=A0 =A0 =A0 =A0 =A0self.proxy_checkbox.set_tooltip_text(&quot;Check this bo=
x to setup the proxy you specified&quot;)<br>
- =A0 =A0 =A0 =A0self.proxy_checkbox.set_active(self.enable_proxy)<br>
+ =A0 =A0 =A0 =A0self.proxy_checkbox.set_active(self.configuration.enable_p=
roxy)<br>
=A0 =A0 =A0 =A0 =A0self.proxy_checkbox.connect(&quot;toggled&quot;, self.pr=
oxy_checkbox_toggled_cb)<br>
=A0 =A0 =A0 =A0 =A0sub_vbox.pack_start(self.proxy_checkbox, expand=3DFalse,=
 fill=3DFalse)<br>
<br>
=A0 =A0 =A0 =A0 =A0label =3D self.gen_label_widget(&quot;&lt;span weight=3D=
\&quot;bold\&quot;&gt;Set all proxy:&lt;/span&gt;&quot;)<br>
=A0 =A0 =A0 =A0 =A0tooltip =3D &quot;Set the all proxy that will be used if=
 the proxy for a URL isn&#39;t specified.&quot;<br>
=A0 =A0 =A0 =A0 =A0proxy_widget, self.all_proxy_text =3D self.gen_entry_wid=
get(self.configuration.all_proxy, self, tooltip, False)<br>
- =A0 =A0 =A0 =A0self.all_proxy_text.set_editable(self.enable_proxy)<br>
- =A0 =A0 =A0 =A0self.all_proxy_text.set_sensitive(self.enable_proxy)<br>
+ =A0 =A0 =A0 =A0self.all_proxy_text.set_editable(self.configuration.enable=
_proxy)<br>
+ =A0 =A0 =A0 =A0self.all_proxy_text.set_sensitive(self.configuration.enabl=
e_proxy)<br>
=A0 =A0 =A0 =A0 =A0sub_vbox.pack_start(label, expand=3DFalse, fill=3DFalse)=
<br>
=A0 =A0 =A0 =A0 =A0sub_vbox.pack_start(proxy_widget, expand=3DFalse, fill=
=3DFalse)<br>
<br>
=A0 =A0 =A0 =A0 =A0label =3D self.gen_label_widget(&quot;&lt;span weight=3D=
\&quot;bold\&quot;&gt;Set http proxy:&lt;/span&gt;&quot;)<br>
=A0 =A0 =A0 =A0 =A0tooltip =3D &quot;Set the http proxy that will be used i=
n do_fetch() source code&quot;<br>
=A0 =A0 =A0 =A0 =A0proxy_widget, self.http_proxy_text =3D self.gen_entry_wi=
dget(self.configuration.http_proxy, self, tooltip, False)<br>
- =A0 =A0 =A0 =A0self.http_proxy_text.set_editable(self.enable_proxy)<br>
- =A0 =A0 =A0 =A0self.http_proxy_text.set_sensitive(self.enable_proxy)<br>
+ =A0 =A0 =A0 =A0self.http_proxy_text.set_editable(self.configuration.enabl=
e_proxy)<br>
+ =A0 =A0 =A0 =A0self.http_proxy_text.set_sensitive(self.configuration.enab=
le_proxy)<br>
=A0 =A0 =A0 =A0 =A0sub_vbox.pack_start(label, expand=3DFalse, fill=3DFalse)=
<br>
=A0 =A0 =A0 =A0 =A0sub_vbox.pack_start(proxy_widget, expand=3DFalse, fill=
=3DFalse)<br>
<br>
=A0 =A0 =A0 =A0 =A0label =3D self.gen_label_widget(&quot;&lt;span weight=3D=
\&quot;bold\&quot;&gt;Set https proxy:&lt;/span&gt;&quot;)<br>
=A0 =A0 =A0 =A0 =A0tooltip =3D &quot;Set the https proxy that will be used =
in do_fetch() source code&quot;<br>
=A0 =A0 =A0 =A0 =A0proxy_widget, self.https_proxy_text =3D self.gen_entry_w=
idget(self.configuration.https_proxy, self, tooltip, False)<br>
- =A0 =A0 =A0 =A0self.https_proxy_text.set_editable(self.enable_proxy)<br>
- =A0 =A0 =A0 =A0self.https_proxy_text.set_sensitive(self.enable_proxy)<br>
+ =A0 =A0 =A0 =A0self.https_proxy_text.set_editable(self.configuration.enab=
le_proxy)<br>
+ =A0 =A0 =A0 =A0self.https_proxy_text.set_sensitive(self.configuration.ena=
ble_proxy)<br>
=A0 =A0 =A0 =A0 =A0sub_vbox.pack_start(label, expand=3DFalse, fill=3DFalse)=
<br>
=A0 =A0 =A0 =A0 =A0sub_vbox.pack_start(proxy_widget, expand=3DFalse, fill=
=3DFalse)<br>
<br>
=A0 =A0 =A0 =A0 =A0label =3D self.gen_label_widget(&quot;&lt;span weight=3D=
\&quot;bold\&quot;&gt;Set ftp proxy:&lt;/span&gt;&quot;)<br>
=A0 =A0 =A0 =A0 =A0tooltip =3D &quot;Set the ftp proxy that will be used in=
 do_fetch() source code&quot;<br>
=A0 =A0 =A0 =A0 =A0proxy_widget, self.ftp_proxy_text =3D self.gen_entry_wid=
get(self.configuration.ftp_proxy, self, tooltip, False)<br>
- =A0 =A0 =A0 =A0self.ftp_proxy_text.set_editable(self.enable_proxy)<br>
- =A0 =A0 =A0 =A0self.ftp_proxy_text.set_sensitive(self.enable_proxy)<br>
+ =A0 =A0 =A0 =A0self.ftp_proxy_text.set_editable(self.configuration.enable=
_proxy)<br>
+ =A0 =A0 =A0 =A0self.ftp_proxy_text.set_sensitive(self.configuration.enabl=
e_proxy)<br>
=A0 =A0 =A0 =A0 =A0sub_vbox.pack_start(label, expand=3DFalse, fill=3DFalse)=
<br>
=A0 =A0 =A0 =A0 =A0sub_vbox.pack_start(proxy_widget, expand=3DFalse, fill=
=3DFalse)<br>
<br>
=A0 =A0 =A0 =A0 =A0label =3D self.gen_label_widget(&quot;&lt;span weight=3D=
\&quot;bold\&quot;&gt;Set git proxy:&lt;/span&gt;&quot;)<br>
=A0 =A0 =A0 =A0 =A0tooltip =3D &quot;Set the git proxy that will be used in=
 do_fetch() source code&quot;<br>
=A0 =A0 =A0 =A0 =A0proxy_widget, self.git_proxy_text =3D self.gen_entry_wid=
get(self.configuration.git_proxy_host + &#39;:&#39; + self.configuration.gi=
t_proxy_port, self, tooltip, False)<br>
- =A0 =A0 =A0 =A0self.git_proxy_text.set_editable(self.enable_proxy)<br>
- =A0 =A0 =A0 =A0self.git_proxy_text.set_sensitive(self.enable_proxy)<br>
+ =A0 =A0 =A0 =A0self.git_proxy_text.set_editable(self.configuration.enable=
_proxy)<br>
+ =A0 =A0 =A0 =A0self.git_proxy_text.set_sensitive(self.configuration.enabl=
e_proxy)<br>
=A0 =A0 =A0 =A0 =A0sub_vbox.pack_start(label, expand=3DFalse, fill=3DFalse)=
<br>
=A0 =A0 =A0 =A0 =A0sub_vbox.pack_start(proxy_widget, expand=3DFalse, fill=
=3DFalse)<br>
<br>
=A0 =A0 =A0 =A0 =A0label =3D self.gen_label_widget(&quot;&lt;span weight=3D=
\&quot;bold\&quot;&gt;Set cvs proxy:&lt;/span&gt;&quot;)<br>
=A0 =A0 =A0 =A0 =A0tooltip =3D &quot;Set the cvs proxy that will be used in=
 do_fetch() source code&quot;<br>
=A0 =A0 =A0 =A0 =A0proxy_widget, self.cvs_proxy_text =3D self.gen_entry_wid=
get(self.configuration.cvs_proxy_host + &#39;:&#39; + self.configuration.cv=
s_proxy_port, self, tooltip, False)<br>
- =A0 =A0 =A0 =A0self.cvs_proxy_text.set_editable(self.enable_proxy)<br>
- =A0 =A0 =A0 =A0self.cvs_proxy_text.set_sensitive(self.enable_proxy)<br>
+ =A0 =A0 =A0 =A0self.cvs_proxy_text.set_editable(self.configuration.enable=
_proxy)<br>
+ =A0 =A0 =A0 =A0self.cvs_proxy_text.set_sensitive(self.configuration.enabl=
e_proxy)<br>
=A0 =A0 =A0 =A0 =A0sub_vbox.pack_start(label, expand=3DFalse, fill=3DFalse)=
<br>
=A0 =A0 =A0 =A0 =A0sub_vbox.pack_start(proxy_widget, expand=3DFalse, fill=
=3DFalse)<br>
<br>
@@ -600,19 +600,19 @@ class AdvancedSettingDialog (CrumbsDialog):<br>
=A0 =A0 =A0 =A0 =A0return advanced_vbox<br>
<br>
=A0 =A0 =A0def proxy_checkbox_toggled_cb(self, button):<br>
- =A0 =A0 =A0 =A0self.enable_proxy =3D self.proxy_checkbox.get_active()<br>
- =A0 =A0 =A0 =A0self.all_proxy_text.set_editable(self.enable_proxy)<br>
- =A0 =A0 =A0 =A0self.all_proxy_text.set_sensitive(self.enable_proxy)<br>
- =A0 =A0 =A0 =A0self.http_proxy_text.set_editable(self.enable_proxy)<br>
- =A0 =A0 =A0 =A0self.http_proxy_text.set_sensitive(self.enable_proxy)<br>
- =A0 =A0 =A0 =A0self.https_proxy_text.set_editable(self.enable_proxy)<br>
- =A0 =A0 =A0 =A0self.https_proxy_text.set_sensitive(self.enable_proxy)<br>
- =A0 =A0 =A0 =A0self.ftp_proxy_text.set_editable(self.enable_proxy)<br>
- =A0 =A0 =A0 =A0self.ftp_proxy_text.set_sensitive(self.enable_proxy)<br>
- =A0 =A0 =A0 =A0self.git_proxy_text.set_editable(self.enable_proxy)<br>
- =A0 =A0 =A0 =A0self.git_proxy_text.set_sensitive(self.enable_proxy)<br>
- =A0 =A0 =A0 =A0self.cvs_proxy_text.set_editable(self.enable_proxy)<br>
- =A0 =A0 =A0 =A0self.cvs_proxy_text.set_sensitive(self.enable_proxy)<br>
+ =A0 =A0 =A0 =A0self.configuration.enable_proxy =3D self.proxy_checkbox.ge=
t_active()<br>
+ =A0 =A0 =A0 =A0self.all_proxy_text.set_editable(self.configuration.enable=
_proxy)<br>
+ =A0 =A0 =A0 =A0self.all_proxy_text.set_sensitive(self.configuration.enabl=
e_proxy)<br>
+ =A0 =A0 =A0 =A0self.http_proxy_text.set_editable(self.configuration.enabl=
e_proxy)<br>
+ =A0 =A0 =A0 =A0self.http_proxy_text.set_sensitive(self.configuration.enab=
le_proxy)<br>
+ =A0 =A0 =A0 =A0self.https_proxy_text.set_editable(self.configuration.enab=
le_proxy)<br>
+ =A0 =A0 =A0 =A0self.https_proxy_text.set_sensitive(self.configuration.ena=
ble_proxy)<br>
+ =A0 =A0 =A0 =A0self.ftp_proxy_text.set_editable(self.configuration.enable=
_proxy)<br>
+ =A0 =A0 =A0 =A0self.ftp_proxy_text.set_sensitive(self.configuration.enabl=
e_proxy)<br>
+ =A0 =A0 =A0 =A0self.git_proxy_text.set_editable(self.configuration.enable=
_proxy)<br>
+ =A0 =A0 =A0 =A0self.git_proxy_text.set_sensitive(self.configuration.enabl=
e_proxy)<br>
+ =A0 =A0 =A0 =A0self.cvs_proxy_text.set_editable(self.configuration.enable=
_proxy)<br>
+ =A0 =A0 =A0 =A0self.cvs_proxy_text.set_sensitive(self.configuration.enabl=
e_proxy)<br>
<br>
=A0 =A0 =A0def response_cb(self, dialog, response_id):<br>
=A0 =A0 =A0 =A0 =A0package_format =3D []<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.9.5<br>
<br>
</font></span></blockquote></div><br>

--00235429dc70df606b04c956954e--
